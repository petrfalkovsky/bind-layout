import 'package:get/get.dart' hide Trans;
import 'package:riverside/core/utils/stream_subscriber.dart';

class MyBookingsService extends GetxService with StreamSubscriberMixin {
  MyBookingsService();

  final _name = 'мои брони'.obs;
  String get name$ => _name();

  final isMame = false.obs;

  void changeName() {
    isMame(!isMame());

    isMame() ? _name('other name') : _name('мои брони');
  }
}
