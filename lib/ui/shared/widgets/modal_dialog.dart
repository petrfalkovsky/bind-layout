import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all_shared.dart';

class ModalDialog {
  void showModalDialog(
    context, {
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? containerPadding,
    Color? barrierColor,
    bool barrierDismissible = false,
    Color decorationColor = AppColors.white,
    BorderRadiusGeometry? borderRadius,
  }) {
    showGeneralDialog(
      context: context,
      barrierColor: barrierColor ?? AppColors.primaryBlack.withOpacity(.8),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: width ?? Get.width - 20,
            height: height ?? Get.width + 80,
            padding: containerPadding ?? const EdgeInsets.all(20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: decorationColor,
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(8)),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
