import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverside/ui/shared/widgets/general_scaffold/src/general_scaffold_service.dart';
import 'package:riverside/ui/shared/all_shared.dart';

PreferredSizeWidget getStatAppBar(
  BuildContext context, {
  Color? color,
  required String text,
  bool isLeading = false,
  String? buttonText,
  List<Widget>? actions,
  double? elevation,
  String? router,
  dynamic resultBack,
  Function()? funcBack,
  int? currentNavIndex,
}) {
  return AppBar(
    elevation: elevation ?? .5,
    title: Text(
      text,
      style: AppStyles.text17
          .andWeight(FontWeight.w600)
          .andColor(AppColors.textDark),
    ),
    centerTitle: true,
    backgroundColor: color ?? AppColors.background,
    leading: isLeading
        ? IconButton(
            onPressed: () {
              funcBack?.call();
              if (router == null) {
                Get.back(result: resultBack);
              } else {
                Get.offNamed(router);
                if (currentNavIndex != null) {
                  Get.find<GeneralScaffoldService>()
                      .currentNavIndex(currentNavIndex);
                }
              }
            },
            icon: RotatedBox(
              quarterTurns: 45,
              // child:
              //     AppIcons.svgWidget(AppIcons.arrowDown, width: 28, height: 28),
            ),
          )
        : Container(),
    actions: actions,
  );
}
