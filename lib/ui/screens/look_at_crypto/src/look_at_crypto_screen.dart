import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:bind_layout/ui/screens/look_at_crypto/look_at_crypto.dart';
import 'package:bind_layout/ui/shared/widgets/general_scaffold/scaffold_sirius.dart';
import 'package:bind_layout/ui/shared/widgets/std_button.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class LookAtCryptoLayout extends StatexWidget<LookAtCryptoLayoutController> {
  LookAtCryptoLayout({Key? key})
      : super(() => LookAtCryptoLayoutController(), key: key) {
    debugPrint(' LookAtCryptoLayout.LookAtCryptoLayout');
  }

  @override
  Widget buildWidget(BuildContext context) {
    return GeneralScaffold(
      navBarEnable: true,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              title: Obx(
                () => Text(
                  controller.name$,
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: StdButton(
                text: 'Other name',
                isActive: true,
                onPress: controller.changeName,
              ),
            ),
            // const SliverToBoxAdapter(
            //   child: _BookingsDateFilter(),
            // ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16.0),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
