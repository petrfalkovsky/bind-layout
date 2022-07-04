import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:bind_layout/data/repository/local/local_repository.dart';
import 'package:bind_layout/data/repository/remote/remote_repository.dart';
import 'package:bind_layout/logic/repository/repository.dart';

@prod
@LazySingleton(as: Repository)
class RepositoryImpl extends Repository {
  RepositoryImpl(LocalRepository? local, RemoteRepository? remote)
      : _local = local ?? GetIt.I.get(),
        _remote = remote ?? GetIt.I.get();

  final LocalRepository _local;
  final RemoteRepository _remote;
}
