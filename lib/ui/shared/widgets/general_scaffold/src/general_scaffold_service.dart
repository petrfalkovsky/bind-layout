import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_it/get_it.dart';
import 'package:bind_layout/core/utils/stream_subscriber.dart';
import 'package:bind_layout/logic/repository/repository.dart';
import 'package:bind_layout/ui/router/routing.dart';
import 'package:bind_layout/ui/screens/internet/src/internet_service.dart';
import 'package:bind_layout/ui/shared/all_shared.dart';

class GeneralScaffoldService extends GetxService with StreamSubscriberMixin {
  GeneralScaffoldService({
    InternetScreenService? internetScreenService,
    Repository? repo,
  })  : _internetScreenService = internetScreenService ?? Get.find(),
        _repo = repo ?? GetIt.I.get();

  final InternetScreenService _internetScreenService;
  final Repository _repo;

  final _currentNavIndex = 0.obs; // для BottomNavigationBar index
  int get currentNavIndex$ => _currentNavIndex();
  void currentNavIndex(int index) => _currentNavIndex(index);

  ConnectivityResult get connectionStatus$ =>
      _internetScreenService.connectionStatus$;

  final _listBottomNav = <BottomNavModel>[
    BottomNavModel(
      text: 'Знакомимся',
      activeColor: AppColors.red,
      icon: AppIcons.navDot,
      router: AppRoutes.niceEMeetYou,
    ),
    BottomNavModel(
      text: 'Посмотреть страничку',
      activeColor: AppColors.red,
      icon: AppIcons.navStar,
      router: AppRoutes.lookAtCryptoLayout,
    ),
    // BottomNavModel(
    //   text: 'mobile_wallet_app.exchange',
    //   activeColor: AppColors.red,
    //   icon: AppIcons.navExchange,
    //   router: '',
    // ),
    // BottomNavModel(
    //   text: 'mobile_wallet_app.transfer',
    //   activeColor: AppColors.red,
    //   icon: AppIcons.navTransfer,
    //   router: '',
    // ),
    // BottomNavModel(
    //   text: 'mobile_wallet_app.settings',
    //   activeColor: AppColors.red,
    //   icon: AppIcons.navSettings,
    //   router: '',
    // ),
  ].obs;

  List<BottomNavModel> get listBottomNav => _listBottomNav();

  void goToPage(int index) {
    Get.offNamed(_listBottomNav[index].router);
    currentNavIndex(index);
  }

  int? _lastTimeBackButtonWasTapped;
  Future<bool> doubleExit() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (_lastTimeBackButtonWasTapped != null &&
        (currentTime - (_lastTimeBackButtonWasTapped ?? 0)) <
            Consts.exitTimeInMillis) {
      return Future.value(true);
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      alert(value: 'Press Back button again to Exit', color: AppColors.green);
      return Future.value(false);
    }
  }

  Future<bool> tryExit() async {
    // final token = await _repo.readToken();
    // if (token.isValid() && currentNavIndex$ == 0) {
    //   return await doubleExit();
    // }
    // if (token.isValid()) {
    //   Get.back();
    // }
    return Future.value(false);
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('ONINIT SCAFFOLD SIRIUS SERVICE');
    // Передача состояния из BLoC
  }
}

class BottomNavModel {
  Color activeColor;
  String icon;
  String text;
  String router;

  BottomNavModel({
    required this.activeColor,
    required this.icon,
    required this.text,
    required this.router,
  });
}
