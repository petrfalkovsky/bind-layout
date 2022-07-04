import 'package:bind_layout/ui/screens/nice_e_meet_you/src/nice_e_meet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bind_layout/ui/shared/widgets/general_scaffold/scaffold_sirius.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class NiceEMeetYou extends StatexWidget<NiceEMeetYouController> {
  NiceEMeetYou({Key? key}) : super(() => NiceEMeetYouController(), key: key) {
    debugPrint(' NiceEMeetYou.NiceEMeetYou');
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const GeneralScaffold(
      navBarEnable: true,
      child: Center(child: Text('бронирование')),
    );
  }
}
