import 'package:get_it/get_it.dart';
import 'package:riverside/core/utils/stream_subscriber.dart';
import 'package:riverside/data/repository/local/local_repository.dart';
import 'package:riverside/ui/router/routing.dart';
import 'package:riverside/ui/screens/splash/src/splash_service.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:get/get.dart';

class SplashScreenController extends StatexController
    with StreamSubscriberMixin {
  SplashScreenController({
    SplashScreenService? service,
    LocalRepository? repoLocal,
  })  : _service = service ?? Get.find(),
        _repoLocal = repoLocal ?? GetIt.I.get();

  final SplashScreenService _service;
  final LocalRepository _repoLocal;

  // Stream<Token> get tokenStream$ => _service.tokenStream$;

  @override
  void onInit() {
    super.onInit();
    // subscribeIt(tokenStream$.listen(_processAuth));
  }

  @override
  void onReady() {
    super.onReady();
    Get.offNamed(AppRoutes.niceEMeetYou);
  }

  @override
  void onWidgetInitState() {
    super.onWidgetInitState();
    // delayMilli(1000).then((_) => _service.fetchToken());
  }

  // void _processAuth(Token token) async {
  //   final finger = await _repoLocal.readFingerPrint();
  //   final getPin = await _repoLocal.readPinCode();
  //   final pin = getPin.fold((l) => 'Error pincode', (r) => r.getOrElse(''));
  //   final isPinFinger = pin != '' && finger;

  //   token.value.fold(
  //     (l) => Get.offNamed(AppRoutes.signIn),
  //     (r) {
  //       if (pin == '' && !isPinFinger) {
  //         Get.offNamed(AppRoutes.setPin);
  //       } else if (pin != '' || isPinFinger) {
  //         Get.offNamed(AppRoutes.enterPin);
  //       } else {
  //         Get.offNamed(AppRoutes.dashboard);
  //       }
  //     },
  //   );
  // }
}
