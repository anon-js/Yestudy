import 'package:flutter/material.dart';

import 'colors.dart';

enum AppStyle {
  bold_32px,
  bold_24px,
  semiBold_24px,
  semiBold_20px,
  medium_20px,
  medium_16px,
  medium_12px,
  regular_20px,
  regular_16px,
  regular_14px,
  regular_12px,
}

extension AppStyleExtension on AppStyle {
  TextStyle get rawValue {
    switch (this) {
      case AppStyle.bold_32px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        );
      case AppStyle.bold_24px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        );
      case AppStyle.semiBold_24px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        );
      case AppStyle.semiBold_20px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        );
      case AppStyle.medium_20px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        );
      case AppStyle.medium_16px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        );
      case AppStyle.medium_12px:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        );
      case AppStyle.regular_20px:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        );
      case AppStyle.regular_16px:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        );
      case AppStyle.regular_14px:
        return const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        );
      case AppStyle.regular_12px:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        );
    }
  }
}
