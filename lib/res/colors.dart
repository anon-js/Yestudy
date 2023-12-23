import 'package:flutter/material.dart';

enum AppColor {
  primary_50,
  primary_500,
  primary_800,
  gray_50,
  gray_100,
  gray_200,
  gray_300,
  gray_400,
  gray_500,
  gray_600,
  gray_700,
  gray_800,
  yellow_50,
  red_50,
  shadow1,
  startBtn,
  startBtnBg
}

extension AppColorExtension on AppColor {
  Color get rawValue {
    switch (this) {
      case AppColor.primary_50:
        return const Color(0xffF5F7FF);
      case AppColor.primary_500:
        return const Color(0xff3A5FCC);
      case AppColor.primary_800:
        return const Color(0xff193895);
      case AppColor.gray_50:
        return const Color(0xffF7F8FB);
      case AppColor.gray_100:
        return const Color(0xffF5F5F7);
      case AppColor.gray_200:
        return const Color(0xffEDEFF1);
      case AppColor.gray_300:
        return const Color(0xffE9EAED);
      case AppColor.gray_400:
        return const Color(0xffD9D9D9);
      case AppColor.gray_500:
        return const Color(0xff777777);
      case AppColor.gray_600:
        return const Color(0xff6F737C);
      case AppColor.gray_700:
        return const Color(0xff2D3847);
      case AppColor.gray_800:
        return const Color(0xff1D1D1F);
      case AppColor.yellow_50:
        return const Color(0xffFFFAE2);
      case AppColor.red_50:
        return const Color(0xffFFE4E4);
      case AppColor.shadow1:
        return const Color(0x26C3C8D2);
      case AppColor.startBtn:
        return const Color(0xffCAFFF2);
      case AppColor.startBtnBg:
        return const Color(0xff0CB98E);
    }
  }
}
