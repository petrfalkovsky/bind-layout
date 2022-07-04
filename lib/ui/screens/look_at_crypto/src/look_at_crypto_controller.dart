import 'package:bind_layout/ui/screens/look_at_crypto/src/look_at_crypto_service.dart';
import 'package:get/get.dart';
import 'package:bind_layout/ui/screens/look_at_crypto/look_at_crypto.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class LookAtCryptoLayoutController extends StatexController {
  LookAtCryptoLayoutController({LookAtCryptoLayoutService? service})
      : _service = service ?? Get.find();

  final LookAtCryptoLayoutService _service;

  String get name$ => _service.name$;
  void changeName() => _service.changeName();
}
