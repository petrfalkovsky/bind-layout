import 'package:riverside/core/safe_coding/src/either.dart';
import 'package:riverside/core/safe_coding/src/unit.dart';
import 'package:riverside/domain/core/value_objects.dart';

export 'src/shared_pref_repo_impl.dart';

/// Абстракция локального репозитория.
/// [saveProfileDtoString] / [getProfileDtoString]:
///   Предположим - локальный репозиторий манипулирует профилями, как строками.
abstract class LocalRepository {
  Future<Either<String, NonEmptyString>> readPinCode();
}
