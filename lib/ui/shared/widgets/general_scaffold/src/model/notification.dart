import 'package:flutter/material.dart';
import 'package:bind_layout/ui/shared/all_shared.dart';

class Notification {
  final String dateTime;
  final List<InlineSpan> richText;

  Notification({required this.richText, required this.dateTime});
}

List<Notification> notifications = [
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
  Notification(richText: [
    const TextSpan(text: "Пополнен кошелек на сумму "),
    TextSpan(
        text: " 39 888 рублей.",
        style: AppStyles.text14.andWeight(FontWeight.w600)),
    const TextSpan(text: " Теперь вы мо..."),
  ], dateTime: "11 минут назад"),
];
