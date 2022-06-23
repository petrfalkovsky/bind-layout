import 'package:get/get.dart';
import 'package:riverside/ui/screens/my_bookings/my_bookings.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class MyBookingsController extends StatexController {
  MyBookingsController({MyBookingsService? service})
      : _service = service ?? Get.find();

  final MyBookingsService _service;

  String get name$ => _service.name$;
  void changeName() => _service.changeName();
}
