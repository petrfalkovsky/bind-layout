import 'package:flutter/material.dart';
import 'package:bind_layout/ui/shared/all_shared.dart';
import 'package:bind_layout/ui/shared/widgets/background.dart';
import 'package:bind_layout/ui/shared/widgets/general_scaffold/src/general_scaffold.dart';

import 'package:vfx_flutter_common/getx_helpers.dart';

import 'splash_controller.dart';

class SplashScreen extends StatexWidget<SplashScreenController> {
  SplashScreen({Key? key}) : super(() => SplashScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return const GeneralScaffold(
      navBarEnable: false,
      child: Background(),
    );
  }
}
