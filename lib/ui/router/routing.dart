import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:riverside/ui/screens/my_bookings/my_bookings.dart';
import 'package:riverside/ui/screens/sign_in/sign_in.dart';
import 'package:riverside/ui/screens/splash/splash.dart';

import '../screens/bookings/bookings.dart';

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
