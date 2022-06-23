import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverside/ui/screens/bookings/bookings.dart';
import 'package:riverside/ui/shared/widgets/general_scaffold/scaffold_sirius.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class NiceEMeetYou extends StatexWidget<BookingsController> {
  NiceEMeetYou({Key? key}) : super(() => BookingsController(), key: key) {
    debugPrint(' Bookings.Bookings');
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const GeneralScaffold(
      navBarEnable: true,
      child: Center(child: Text('бронирование')),
    );
  }
}
