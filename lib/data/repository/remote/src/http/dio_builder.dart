import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:bind_layout/app_config.dart';
import 'package:bind_layout/core/services/app_logger.dart';
import 'package:bind_layout/data/repository/local/local_repository.dart';
import 'package:bind_layout/domain/core/extended_errors.dart';
import 'package:bind_layout/ui/shared/ext.dart';

abstract class IDioProvider {
  Dio get dio;

  String get baseUrl;
}

@prod
@LazySingleton(as: IDioProvider)
class DioBuilder implements IDioProvider {
  DioBuilder({
    LocalRepository? repo,
  }) : repoLocal = repo ?? GetIt.I.get();

  // final AppLogger _logger;
  //_authService = accessTokenService ?? GetIt.I.get()

  // final AuthService _authService;
  final LocalRepository repoLocal;

  Dio? _dio;

  @override
  String get baseUrl => dio.options.baseUrl;

  @override
  Dio get dio => _dio ??= _buildDio();

  Dio _buildDio() {
    final options = BaseOptions(baseUrl: AppConfig.apiEndpoint);
    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        await _setHeaders(options);
        log(
          '${options.method} ${options.uri.toString()}\n${options.headers}\n${options.extra}',
          name: 'HTTP REQUEST',
        );
        log(options.data.toString());

        if (!AppConfig.isProduction &&
            options.data != null &&
            options.data is Map) {
          // TODO: do for FormData
          final bodyAsString = jsonEncode(options.data);
          log(
            bodyAsString,
            name: 'HTTP REQUEST BODY',
          );
        }

        return handler.next(options);
      },
      onResponse: (response, handler) async {
        final respString = response.toString();
        log(
            respString.substring(
              0,
              respString.length > 200 ? 200 : respString.length - 1,
            ),
            name: 'HTTP RESPONSE');
        return handler.next(response);
      },
      onError: _onError,
    ));

    final headers = {
      'Accept': 'application/json',
    };

    dio.options.headers = headers;
    return dio;
  }

  Future _onError(DioError e, handler) async {
    loggerSimple
        .i('DioBuilder._onError: ${e.response} / ${e.response?.statusCode}');
    return _resolveErrorForClient(e.response?.statusCode ?? -1, e, handler);
  }

  /// Помощь для передачи разного рода ошибок клиенту
  /// Передается код и ендпойнт
  Future _resolveErrorForClient(int statusCode, DioError e, handler) async {
    final partOf = e.toString().maxLen(200);
    final errors =
        e.response?.data as Map<String, dynamic>? ?? <String, dynamic>{};

    loggerSimple.i('DioBuilder._resolveErrorForClient: errors.1=$errors');

    if (!errors.containsKey(ExtendedErrorsX.errorKey)) {
      errors[ExtendedErrorsX.errorKey] = partOf;
    }
    if (!errors.containsKey(ExtendedErrorsX.errorsKey)) {
      errors[ExtendedErrorsX.errorsKey] = <String, dynamic>{
        ExtendedErrorsX.errorKey: [errors[ExtendedErrorsX.errorKey]],
      };
    }

    // В случае облома авторизации выходим!
    // Но не отправляем reject, чтобы не нарушать систему ошибок
    if ([401].contains(statusCode)) {
      debugPrint('401 logout ');
    }

    /// Тут можно добавлять ошибки, которые чисто DIO
    if ([500].contains(statusCode)) {
      errors[ExtendedErrorsX.errorsKey][ExtendedErrorsX.dioErrorKey] = [partOf];
      errors[ExtendedErrorsX.errorsKey][ExtendedErrorsX.isDioKey] = [true];
    }

    loggerSimple.i('DioBuilder._resolveErrorForClient: errors.2=$errors');

    /// Тут добавим полезную инфу
    errors[ExtendedErrorsX.errorsKey]
        [ExtendedErrorsX.dioStatusCodeKey] = [statusCode];
    errors[ExtendedErrorsX.errorsKey]
        [ExtendedErrorsX.dioApiKey] = [e.requestOptions.path];

    loggerSimple.i('DioBuilder._resolveErrorForClient: errors.3=$errors');

    final respNew = Response(
        requestOptions:
            e.response?.requestOptions ?? RequestOptions(path: 'unknown path'),
        data: <String, dynamic>{
          'status': false,
          'errors': errors,
        });
    return handler.resolve(respNew);
  }

  Future _setHeaders(RequestOptions options) async {
    loggerSimple.i(
        'DioBuilder._setHeaders: token='); //${_authService.token$.getOrElse('')}
    options.headers['Authorization'] =
        ''; //Bearer ${_authService.token$.getOrElse('')}
    // options.headers['Locale'] = (await repoLocal.readLanguage())
    //     .fold((l) => l, (r) => r.value.getOrElse(() => ''));
    loggerSimple.i('DioBuilder._setHeaders: ${options.headers}');
  }
}
