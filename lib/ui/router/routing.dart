import 'package:bind_layout/ui/screens/nice_e_meet_you/src/nice_e_meet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:bind_layout/ui/screens/look_at_crypto/look_at_crypto.dart';
import 'package:bind_layout/ui/screens/sign_in/sign_in.dart';
import 'package:bind_layout/ui/screens/splash/splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String niceEMeetYou = '/myBookings';
  static const String lookAtCryptoLayout = '/bookings';

  static navigator(RouteSettings settings) {
    debugPrint('RouteSettings  $settings');
  }
}

final List<GetPage> routes = [
  GetPage(
    name: AppRoutes.splash,
    page: () => SplashScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.signIn,
    page: () => SignInScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.niceEMeetYou,
    page: () => NiceEMeetYou(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.lookAtCryptoLayout,
    page: () => LookAtCryptoLayout(),
    transition: Transition.fadeIn,
  ),

  //settings
];
