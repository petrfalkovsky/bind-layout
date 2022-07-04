import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bind_layout/ui/shared/all_shared.dart';

class AppIcons {
  static String ruPath = 'assets/images/RU.svg';
  static String frPath = 'assets/images/FR.svg';
  static String italPath = 'assets/images/IT.svg';
  static String englandPath = 'assets/images/GB.svg';
  static String espPath = 'assets/images/ES.svg';
  //языки флаги

  static const avatarPath = 'assets/images/avatar.svg';
  static const btc = 'assets/images/bitcoin.svg';
  static const ltc = 'assets/images/litecoin.svg';
  static const eth = 'assets/images/etherium.svg';
  static const trx = 'assets/images/tron-trx-logo.svg';
  static const bnb = 'assets/images/bnb-logo.svg';
  static const trc20 = 'assets/images/tether-usdt-logo.svg';
  static const backPinCodePath = 'assets/images/clean.svg';
  static const fingerPrintPath = 'assets/images/fingerprint.svg';

  //Настройки
  static const about = 'assets/images/about.svg';
  static const feePolicy = 'assets/images/fee-policy.svg';
  static const secutirySettings = 'assets/images/security-settings.svg';
  static const notifications = 'assets/images/notifications.svg';
  static const support = 'assets/images/support.svg';
  static const currency = 'assets/images/currency.svg';

  //Поддержка
  static const faq = 'assets/images/faq.svg';
  static const chatSupport = 'assets/images/chat-support.svg';

  //FAQ
  static const general = 'assets/images/general.svg';
  static const account = 'assets/images/account.svg';
  static const transactions = 'assets/images/transactions.svg';
  static const withdrawals = 'assets/images/withdrawals.svg';
  static const international = 'assets/images/international.svg';

  //настройки безопасности
  static const changeEmail = 'assets/images/email.svg';
  static const updatePinCode = 'assets/images/update-pincode.svg';

  // Иконки для навигации
  // static const navSettings = 'assets/images/nav-settings.svg';
  // static const navTransactions = 'assets/images/nav-transactions.svg';
  static const navStar = 'assets/icons/star.svg';
  static const navDot = 'assets/icons/dot.svg';
  // static const navExchange = 'assets/images/nav-exchange.svg';

  static const received = 'assets/images/received.svg';
  static const send = 'assets/images/send.svg';
  static const exchange = 'assets/images/exchange.svg';
  static const copy = 'assets/images/copy.svg';
  static const arrowDown = 'assets/images/arrow-down.svg';
  static const check = 'assets/images/check.svg';
  static const question = 'assets/images/question.svg';
  static const calendar = 'assets/images/calendar.svg';
  static const noTransition = 'assets/images/no-transactions.svg';
  static const qr = 'assets/images/qr.svg';
  static const logout = 'assets/images/logout.svg';
  static const attach = 'assets/images/attach.svg';
  static const noInternet = 'assets/images/no-internet.svg';

  // Иконки AppBar
  static const receiveAppBar = 'assets/images/receive_appbar.svg';

  static Widget wallet = svgWidget(
      'assets/images/wallet.svg'); //SvgPicture.asset('assets/images/wallet.svg');
  static const logo =
      'assets/images/logo.svg'; //SvgPicture.asset('assets/images/logo.svg');

  static Widget avatar = svgWidget(avatarPath); // SvgPicture.asset(avatarPath);
  static const AssetImage background = AssetImage('assets/images/splash.png');

  static Widget svgWidget(String path,
      {double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
  }

  static Widget arrow({
    required int quarterTurns,
    double width = 21,
    double height = 21,
  }) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: AppIcons.svgWidget(AppIcons.arrowDown,
          width: width, height: height, color: AppColors.textDark),
    );
  }
}

class CryptoIcon extends StatelessWidget {
  const CryptoIcon({
    Key? key,
    required this.icon,
    this.isActive,
    this.color,
    this.width,
    this.height,
    this.outBorder,
    this.inBorder,
    this.paddingIcon,
  }) : super(key: key);

  final String icon;
  final bool? isActive;
  final double? width;
  final double? height;
  final Color? color;
  final double? outBorder;
  final double? inBorder;
  final double? paddingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 40,
      height: height ?? 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive ?? true ? color ?? AppColors.grey : AppColors.grey,
          width: outBorder ?? 2.3,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: isActive ?? true ? color ?? AppColors.grey : AppColors.grey,
      ),
      child: Container(
        padding: EdgeInsets.all(paddingIcon ?? 3),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.background, width: inBorder ?? 3),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: AppIcons.svgWidget(
            _cryptoIcons(icon),
            width: 20,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  String _cryptoIcons(String value) {
    switch (value) {
      case 'BTC':
        return AppIcons.btc;
      case 'LTC':
        return AppIcons.ltc;
      case 'ETH':
        return AppIcons.eth;
      case 'TRX':
        return AppIcons.trx;
      case 'BNB':
        return AppIcons.bnb;
      case 'BEP20':
        return AppIcons.bnb;
      case 'TRC20':
        return AppIcons.trc20;
    }
    return '';
  }
}
