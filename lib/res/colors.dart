import 'package:flutter/material.dart';

enum AppColor {
  primary,
  gray1,
  gray2,
  gray3,
  gray4,
  gray5,
  gray6,
  gray7,
  gray8,
  gray9,
  shadow1,
  startBtn,
  startBtnBg
}

extension AppColorExtension on AppColor {
  Color get rawValue {
    switch (this) {
      case AppColor.primary:
        return const Color(0xff3A5FCC);
      case AppColor.gray1:
        return const Color(0xffF7F8FB);
      case AppColor.gray2:
        return const Color(0xffF5F5F7);
      case AppColor.gray3:
        return const Color(0xffEDEFF1);
      case AppColor.gray4:
        return const Color(0xffE9EAED);
      case AppColor.gray5:
        return const Color(0xffD9D9D9);
      case AppColor.gray6:
        return const Color(0xff777777);
      case AppColor.gray7:
        return const Color(0xff6F737C);
      case AppColor.gray8:
        return const Color(0xff2D3847);
      case AppColor.gray9:
        return const Color(0xff1D1D1F);
      case AppColor.shadow1:
        return const Color(0x26C3C8D2);
      case AppColor.startBtn:
        return const Color(0xffCAFFF2);
      case AppColor.startBtnBg:
        return const Color(0xff0CB98E);
    }
  }
}
