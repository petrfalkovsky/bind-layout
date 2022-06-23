import 'package:flutter/material.dart';

import '../colors.dart';

class FormContainer extends StatelessWidget {
  final bool enableMargin;
  final bool enablePadding;
  final bool widePadding;
  final bool isLeftAlign;
  final List<Widget> childrenWidget;

  const FormContainer({
    Key? key,
    required this.childrenWidget,
    this.enableMargin = true,
    this.enablePadding = true,
    this.widePadding = false,
    this.isLeftAlign = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.background,
          width: 1,
        ),
        color: Colors.white,
      ),
      margin: enableMargin
          ? const EdgeInsets.only(left: 16, right: 16, bottom: 24)
          : const EdgeInsets.only(),
      child: Padding(
        padding: enablePadding && !widePadding
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 24)
            : widePadding
                ? const EdgeInsets.symmetric(horizontal: 24, vertical: 24)
                : const EdgeInsets.only(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: isLeftAlign
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: childrenWidget),
        ),
      ),
    );
  }
}
