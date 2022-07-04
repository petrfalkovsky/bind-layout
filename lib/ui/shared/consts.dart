import 'package:flutter/material.dart';
import 'package:bind_layout/ui/shared/all_shared.dart';

class Consts {
  static const delayMill100 = 100;
  static const exitTimeInMillis = 2000;
  static const showButton = 'showButton';
  static const skipPage = 'skipPage';
  static const preloader = Center(
      child: CircularProgressIndicator(
    color: AppColors.green,
  ));
}
