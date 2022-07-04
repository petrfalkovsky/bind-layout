import 'package:get/get.dart' hide Trans;
import 'package:get_it/get_it.dart';
import 'package:bind_layout/core/utils/stream_subscriber.dart';
import 'package:bind_layout/data/repository/local/local_repository.dart';
import 'package:bind_layout/logic/repository/repository.dart';

class SignInScreenService extends GetxService with StreamSubscriberMixin {
  SignInScreenService({
    Repository? repo,
    LocalRepository? repoLocal,
  })  : _repo = repo ?? GetIt.I.get(),
        _repoLocal = repoLocal ?? GetIt.I.get();

  final Repository _repo;
  final LocalRepository _repoLocal;
}
