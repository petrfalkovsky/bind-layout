import 'package:get/get.dart' hide Trans;
import 'package:riverside/core/utils/stream_subscriber.dart';
import 'package:riverside/ui/screens/sign_in/src/sign_in_service.dart';

import 'package:vfx_flutter_common/getx_helpers.dart';

///
class SignInScreenController extends StatexController
    with StreamSubscriberMixin {
  SignInScreenController({SignInScreenService? service})
      : _service = service ?? Get.find();

  final SignInScreenService _service;
}
