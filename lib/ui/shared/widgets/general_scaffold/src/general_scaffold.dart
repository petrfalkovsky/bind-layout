import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:riverside/ui/screens/internet/internet.dart';
import 'package:riverside/ui/shared/all_shared.dart';
import 'package:riverside/ui/shared/widgets/general_scaffold/src/general_scaffold_service.dart';

class GeneralScaffold extends GetView<GeneralScaffoldService> {
  const GeneralScaffold({
    Key? key,
    required this.child,
    this.appBar,
    this.tabBarEnable = true,
    this.navBarEnable = true,
    this.backgroundColor = AppColors.background,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;
  final bool tabBarEnable;
  final bool navBarEnable;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.tryExit,
      child: Obx(
        () {
          final service = controller;
          final checkInternet = controller.connectionStatus$;
          if (checkInternet == ConnectivityResult.none) {
            return InternetScreen();
          } else {
            if (navBarEnable) {
              return Scaffold(
                appBar: appBar,
                backgroundColor: backgroundColor,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                body: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: SafeArea(
                    child: child,
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    for (var nav in service.listBottomNav)
                      BottomNavigationBarItem(
                        icon: AppIcons.svgWidget(
                          nav.icon,
                          width: 24,
                          height: 24,
                        ),
                        activeIcon: AppIcons.svgWidget(
                          nav.icon,
                          width: 24,
                          height: 24,
                          color: nav.activeColor,
                        ),
                        label: nav.text.tr(),
                      ),
                  ],
                  currentIndex: service.currentNavIndex$,
                  selectedItemColor: AppColors.red,
                  selectedLabelStyle: AppStyles.text10
                      .andWeight(FontWeight.w700)
                      .andColor(AppColors.navTextGrey),
                  unselectedLabelStyle: AppStyles.text10
                      .andColor(AppColors.darkGrey)
                      .andWeight(FontWeight.w700),
                  onTap: (index) {
                    service.goToPage(index);
                    service.currentNavIndex(index);
                  },
                  backgroundColor: AppColors.background,
                  type: BottomNavigationBarType.fixed,
                ),
              );
            } else {
              if (navBarEnable) {
                return Scaffold(
                  appBar: appBar,
                  backgroundColor: backgroundColor,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                  body: GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: SafeArea(
                      child: child,
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      for (var nav in service.listBottomNav)
                        BottomNavigationBarItem(
                          icon: AppIcons.svgWidget(
                            nav.icon,
                            width: 24,
                            height: 24,
                          ),
                          activeIcon: AppIcons.svgWidget(
                            nav.icon,
                            width: 24,
                            height: 24,
                            color: nav.activeColor,
                          ),
                          label: nav.text.tr(),
                        ),
                    ],
                    currentIndex: service.currentNavIndex$,
                    selectedItemColor: AppColors.red,
                    selectedLabelStyle: AppStyles.text10
                        .andWeight(FontWeight.w700)
                        .andColor(AppColors.navTextGrey),
                    unselectedLabelStyle: AppStyles.text10
                        .andColor(AppColors.darkGrey)
                        .andWeight(FontWeight.w700),
                    onTap: (index) {
                      service.goToPage(index);
                      service.currentNavIndex(index);
                    },
                    backgroundColor: AppColors.background,
                    type: BottomNavigationBarType.fixed,
                  ),
                );
              } else {
                return Scaffold(
                  appBar: appBar,
                  backgroundColor: backgroundColor,
                  body: SafeArea(
                    child: GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: child,
                    ),
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }
}
