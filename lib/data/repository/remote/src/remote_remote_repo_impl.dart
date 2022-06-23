import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:riverside/core/safe_coding/src/either.dart';
import 'package:riverside/data/repository/remote/remote_repository.dart';
import 'package:riverside/data/repository/remote/src/http/api_client.dart';
import 'package:riverside/domain/core/extended_errors.dart';

/// Имплементация
@prod
@LazySingleton(as: RemoteRepository)
class MockRemoteRepositoryImpl implements RemoteRepository {
  MockRemoteRepositoryImpl({
    ApiClient? apiClient,
  }) : _client = apiClient ?? GetIt.I.get();

  final ApiClient _client;

  Future<Either<ExtendedErrors, R>> _safeFunc<R>(
      Future<Either<ExtendedErrors, R>> Function() f) async {
    try {
      final r = await f.call();
      return r;
    } on Exception catch (e) {
      debugPrint('ERROR _safeFunc: $e');
      return left(ExtendedErrors.simple(e.toString()));
    }
  }

  // Future<Either<String, R>> _safeFuncS<R>(
  //     Future<Either<String, R>> Function() f) async {
  //   try {
  //     final r = await f.call();
  //     return r;
  //   } on Exception catch (e) {
  //     return left(e.toString());
  //   }
  // }

  Future<Either<List<String>, R>> _safeFuncLS<R>(
      Future<Either<List<String>, R>> Function() f) async {
    try {
      final r = await f.call();
      return r;
    } on Exception catch (e) {
      return left([e.toString()]);
    }
  }
}
