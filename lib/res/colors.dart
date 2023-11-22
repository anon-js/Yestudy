import 'package:flutter/material.dart';

enum AppColor {
  bg,
  border,
  placeholder,
  textPrimary,
  textSecondary,
  textTertiary,
  textQuaternary,
  textQuinary,
  primary,
  startBtn,
  startBtnBg
}

extension AppColorExtension on AppColor {
  Color get rawValue {
    switch (this) {
      case AppColor.bg:
        return const Color(0xffF5F5F7);
      case AppColor.border:
        return const Color(0xffEEEEEE);
      case AppColor.placeholder:
        return const Color(0xff999999);
      case AppColor.textPrimary:
        return const Color(0xff1D1D1F);
      case AppColor.textSecondary:
        return const Color(0xff222222);
      case AppColor.textTertiary:
        return const Color(0xff444444);
      case AppColor.textQuaternary:
        return const Color(0xff888888);
      case AppColor.textQuinary:
        return const Color(0xffCCCCCC);
      case AppColor.primary:
        return const Color(0xff3A5FCC);
      case AppColor.startBtn:
        return const Color(0xffCAFFF2);
      case AppColor.startBtnBg:
        return const Color(0xff0CB98E);
    }
  }
}
