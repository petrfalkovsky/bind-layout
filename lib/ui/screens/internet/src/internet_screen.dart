import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:riverside/ui/screens/internet/src/internet_controller.dart';
import 'package:riverside/ui/shared/all_shared.dart';

import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:vfx_flutter_common/utils.dart';

class InternetScreen extends StatexWidget<InternetScreenController> {
  InternetScreen({Key? key})
      : super(() => InternetScreenController(), key: key) {
    debugPrint('$now: InternetScreen.InternetScreen');
  }

  @override
  Widget buildWidget(BuildContext context) => const _InternetScreen();
}

class _InternetScreen extends GetView<InternetScreenController> {
  const _InternetScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: AppIcons.svgWidget(AppIcons.noInternet)),
                40.h,
                Text(
                  'No internet connection',
                  style: AppStyles.text17
                      .andWeight(FontWeight.bold)
                      .andColor(AppColors.textGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
