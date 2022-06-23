import 'package:flutter/material.dart';

import '../colors.dart';
import '../styles.dart';

class StdButton extends StatelessWidget {
  const StdButton(
      {required this.text,
      required this.isActive,
      this.isOutlined = false,
      this.isLoading = false,
      this.padding,
      required this.onPress,
      Key? key})
      : super(key: key);

  final String text;
  final bool isActive;
  final bool isOutlined;
  final bool isLoading;
  final VoidCallback onPress;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? _CustomOutlinaButton(
            text: text,
            padding: padding,
            isActive: isActive,
            isLoading: isLoading,
            onPress: onPress,
          )
        : _CustomElevatedButton(
            text: text,
            padding: padding,
            isActive: isActive,
            isLoading: isLoading,
            onPress: onPress,
          );
  }
}

class _CustomOutlinaButton extends StatelessWidget {
  const _CustomOutlinaButton({
    Key? key,
    required this.text,
    required this.isActive,
    required this.isLoading,
    required this.onPress,
    this.padding,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final bool isLoading;
  final Function() onPress;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isActive ? onPress : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: isActive ? AppColors.white : AppColors.lightGrey,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        primary: AppColors.green,
        side: BorderSide(
            width: isActive ? 1 : 0,
            color: isActive ? AppColors.green : AppColors.lightGrey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: isLoading
          ? const SizedBox(
              height: 16,
              child: FittedBox(
                child: CircularProgressIndicator(
                  color: AppColors.green,
                  strokeWidth: 8,
                ),
              ),
            )
          : Text(
              text,
              style: AppStyles.text14.andWeight(FontWeight.w600),
            ),
    );
  }
}

class _CustomElevatedButton extends StatelessWidget {
  const _CustomElevatedButton({
    Key? key,
    required this.text,
    required this.isActive,
    required this.isLoading,
    required this.onPress,
    this.padding,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final bool isLoading;
  final Function() onPress;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive
          ? isLoading
              ? null
              : onPress
          : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding ??
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: MaterialStateProperty.all(isActive
            ? isLoading
                ? AppColors.textButtonBg
                : AppColors.green
            : AppColors.textButtonBg),
      ),
      child: isLoading
          ? const SizedBox(
              height: 16,
              child: FittedBox(
                child: CircularProgressIndicator(
                  color: AppColors.green,
                  strokeWidth: 8,
                ),
              ),
            )
          : Text(
              text,
              style: AppStyles.text14.andWeight(FontWeight.w600).andColor(
                  isActive ? AppColors.white : AppColors.textButtonDisabled),
            ),
    );
  }
}
