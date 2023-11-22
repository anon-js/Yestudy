import 'package:flutter/material.dart';

import 'colors.dart';

enum AppStyle { lightTitle, title, subTitle, boldSubTitle, body, small, link }

extension AppStyleExtension on AppStyle {
  TextStyle get rawValue {
    switch (this) {
      case AppStyle.lightTitle:
        return TextStyle(
          color: AppColor.textQuaternary.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        );
      case AppStyle.title:
        return TextStyle(
          color: AppColor.textPrimary.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        );
      case AppStyle.subTitle:
        return TextStyle(
          color: AppColor.textQuaternary.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        );
      case AppStyle.boldSubTitle:
        return TextStyle(
          color: AppColor.textTertiary.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        );
      case AppStyle.body:
        return TextStyle(
          color: AppColor.textSecondary.rawValue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.2,
        );
      case AppStyle.small:
        return TextStyle(
          color: AppColor.textQuaternary.rawValue,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.2,
        );
      case AppStyle.link:
        return const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        );
    }
  }
}
