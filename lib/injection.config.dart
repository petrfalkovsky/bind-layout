// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:bind_layout/core/services/access_token_service.dart' as _i3;
import 'package:bind_layout/data/repository/local/local_repository.dart' as _i6;
import 'package:bind_layout/data/repository/local/src/shared_pref_repo_impl.dart'
    as _i7;
import 'package:bind_layout/data/repository/remote/remote_repository.dart'
    as _i8;
import 'package:bind_layout/data/repository/remote/src/http/api_client.dart'
    as _i4;
import 'package:bind_layout/data/repository/remote/src/http/dio_builder.dart'
    as _i5;
import 'package:bind_layout/data/repository/remote/src/remote_remote_repo_impl.dart'
    as _i9;
import 'package:bind_layout/data/repository/repository.dart' as _i11;
import 'package:bind_layout/logic/repository/repository.dart' as _i10;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AccessTokenService>(() => _i3.AccessTokenService(),
      registerFor: {_prod});
  gh.lazySingleton<_i4.ApiClient>(
      () => _i4.ApiClient(dioProvider: get<_i5.IDioProvider>()),
      registerFor: {_prod});
  gh.lazySingleton<_i5.IDioProvider>(
      () => _i5.DioBuilder(repo: get<_i6.LocalRepository>()),
      registerFor: {_prod});
  gh.lazySingleton<_i6.LocalRepository>(
      () => _i7.SharedPreferenceRepositoryImpl(),
      registerFor: {_prod});
  gh.lazySingleton<_i8.RemoteRepository>(
      () => _i9.MockRemoteRepositoryImpl(apiClient: get<_i4.ApiClient>()),
      registerFor: {_prod});
  gh.lazySingleton<_i10.Repository>(
      () => _i11.RepositoryImpl(
          get<_i6.LocalRepository>(), get<_i8.RemoteRepository>()),
      registerFor: {_prod});
  return get;
}
