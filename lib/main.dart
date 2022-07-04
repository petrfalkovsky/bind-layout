import 'package:bind_layout/ui/screens/look_at_crypto/src/look_at_crypto_service.dart';
import 'package:bind_layout/ui/screens/nice_e_meet_you/src/nice_e_meet_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:bind_layout/app_config.dart';
import 'package:bind_layout/injection.dart';
import 'package:bind_layout/ui/router/routing.dart';
import 'package:bind_layout/ui/screens/internet/src/internet_service.dart';
import 'package:bind_layout/ui/screens/language/language.dart';
import 'package:bind_layout/ui/screens/sign_in/src/sign_in_service.dart';
import 'package:bind_layout/ui/screens/splash/src/splash_service.dart';
import 'package:bind_layout/ui/shared/all_shared.dart';
import 'package:bind_layout/ui/shared/widgets/general_scaffold/src/general_scaffold_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await AppConfig().load();

  debugPrint('main: AppConfig.IS_PRODUCTION = ${AppConfig.isProduction}');

  configureDependencies(Environment.prod);

  await _initServices();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).whenComplete(
    () async {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: AppColors.background,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.background,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
      final lang = Get.find<LanguageScreenService>();
      runApp(
        EasyLocalization(
          saveLocale: true,
          supportedLocales: lang.mapLang.keys.map((e) => Locale(e)).toList(),
          path: 'assets/translations',
          startLocale: Locale(lang.language$.name),
          fallbackLocale: Locale(lang.language$.name),
          child: const App(),
        ),
      );
    },
  );
}
//

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        initialRoute: AppRoutes.splash,
        getPages: routes,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          if (deviceLocale != context.locale) {
            Future.delayed(Duration.zero)
                .then((_) => Get.updateLocale(context.locale));
          }

          Get.find<LanguageScreenService>().startLang(deviceLocale, context);
          return deviceLocale;
        },
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
        ),
      ),
    );
  }
}

Future _initServices() async {
  Get
    ..put(LanguageScreenService())
    ..put(InternetScreenService())
    ..lazyPut(() => SplashScreenService())
    ..lazyPut(() => SignInScreenService())
    ..lazyPut(() => LookAtCryptoLayoutService())
    ..lazyPut(() => NiceEMeetYouService())
    ..lazyPut(() => GeneralScaffoldService());
}
