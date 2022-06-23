import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:riverside/ui/router/routing.dart';

import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:vfx_flutter_common/utils.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../shared/all_shared.dart';
import 'sign_in_controller.dart';

class SignInScreen extends StatexWidget<SignInScreenController> {
  SignInScreen({Key? key}) : super(() => SignInScreenController(), key: key) {
    debugPrint('$now: SignInScreen.SignInScreen');
  }

  @override
  Widget buildWidget(BuildContext context) {
    /// 50 - appBar
    /// 140 - 140.h
    /// 200 - высота картинки + отступы от нее
    /// 300 - нижние блоки с каптчей
    /// 220 - нижние блоки без каптчи

    double heightWithCaptcha = 50 + 140 + 200 + 300;
    double heightWithoutCaptcha = 50 + 140 + 200 + 215;

    final spaceWithCaptcha = (Get.height - heightWithCaptcha) < 0
        ? 0
        : Get.height - heightWithCaptcha;
    final spaceWithoutCaptcha = (Get.height - heightWithoutCaptcha) < 0
        ? 0
        : Get.height - heightWithoutCaptcha;
    return GeneralScaffold(
        navBarEnable: false,
        appBar: getStatAppBar(
          context,
          text: '',
          elevation: 0,
          isLeading: true,
          // funcBack: controller.defaultStart,
          // router: AppRoutes.login,
        ),
        child: Center(
          child: Text('SIGN IN'),
        ));
  }
}
