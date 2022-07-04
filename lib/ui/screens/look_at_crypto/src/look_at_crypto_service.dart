import 'package:get/get.dart' hide Trans;
import 'package:bind_layout/core/utils/stream_subscriber.dart';

class LookAtCryptoLayoutService extends GetxService with StreamSubscriberMixin {
  LookAtCryptoLayoutService();

  final _name = 'мои брони'.obs;
  String get name$ => _name();

  final isMame = false.obs;

  void changeName() {
    isMame(!isMame());

    isMame() ? _name('other name') : _name('мои брони');
  }
}
