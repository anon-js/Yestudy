import 'package:flutter/material.dart';

enum MyColor {
  bg,
  border,
  placeholder,
  textPrimary,
  textSecondary,
  textTertiary,
  textQuaternary,
  primary,
  startBtn,
  startBtnBg
}

extension MyColorExtension on MyColor {
  Color get rawValue {
    switch (this) {
      case MyColor.bg:
        return const Color(0xffF5F5F7);
      case MyColor.border:
        return const Color(0xffEEEEEE);
      case MyColor.placeholder:
        return const Color(0xff999999);
      case MyColor.textPrimary:
        return const Color(0xff1D1D1F);
      case MyColor.textSecondary:
        return const Color(0xff222222);
      case MyColor.textTertiary:
        return const Color(0xff444444);
      case MyColor.textQuaternary:
        return const Color(0xff888888);
      case MyColor.primary:
        return const Color(0xff3A5FCC);
      case MyColor.startBtn:
        return const Color(0xffCAFFF2);
      case MyColor.startBtnBg:
      return const Color(0xff0CB98E);
    }
  }
}
