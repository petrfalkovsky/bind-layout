import 'package:injectable/injectable.dart';
import 'package:bind_layout/core/safe_coding/src/either.dart';
import 'package:bind_layout/data/repository/local/local_repository.dart';
import 'package:bind_layout/domain/core/value_objects.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Имплементация локального репозитория
/// как адаптера к Preference
@prod
@LazySingleton(as: LocalRepository)
class SharedPreferenceRepositoryImpl implements LocalRepository {
  SharedPreferences? _pref;

  static const _showPassKey = 'show_pass';
  static const _loginKey = 'login';
  static const _tokenKey = 'token';
  static const _pinCode = 'pin_code';
  static const _fingerPrint = 'finger_print';
  static const _tabPinCode = 'tab_pin_code';
  static const _language = 'language';

  @override
  Future<Either<String, NonEmptyString>> readPinCode() async {
    final rez = await _getString(_pinCode, def: '');
    return right(NonEmptyString(rez, failureTag: 'pincode'));
  }

  //////////////////////////////////////////////////////////////////////////////

  Future _init() async {
    _pref ??= await SharedPreferences.getInstance();
    return;
  }

  Future _saveString(String key, String data) async {
    await _init();
    await _pref?.setString(key, data);
  }

  Future<String> _getString(String key, {String? def}) async {
    return _init().then((_) => _pref?.getString(key) ?? def ?? '');
  }

  Future _saveBool(String key, bool data) async {
    await _init();
    await _pref?.setBool(key, data);
  }

  Future<bool> _getBool(String key, {bool? def}) async {
    return _init().then((_) => _pref?.getBool(key) ?? def ?? false);
  }

  Future<bool> _removeString(String key) async {
    await _init();
    return await _pref?.remove(key) ?? false;
  }

  Future _saveInt(String key, int data) async {
    await _init();
    await _pref?.setInt(key, data);
  }

  Future<int> _getInt(String key) async {
    return _init().then((_) => _pref?.getInt(key) ?? 0);
  }
  //~ Спрячем базовый интерфейс

}
