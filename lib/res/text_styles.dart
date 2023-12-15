import 'package:flutter/material.dart';

import 'colors.dart';

enum AppStyle { dday, lightTitle, title, subTitle, boldSubTitle, body, bodyDesc, small, link, desc }

extension AppStyleExtension on AppStyle {
  TextStyle get rawValue {
    switch (this) {
      case AppStyle.dday:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        );
      case AppStyle.lightTitle:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        );
      case AppStyle.title:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        );
      case AppStyle.subTitle:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        );
      case AppStyle.boldSubTitle:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        );
      case AppStyle.body:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.2,
        );
      case AppStyle.bodyDesc:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.2,
        );
      case AppStyle.small:
        return TextStyle(
          color: AppColor.gray6.rawValue,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.2,
        );
      case AppStyle.link:
        return const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        );
      case AppStyle.desc:
        return TextStyle(
          color: AppColor.gray9.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        );
    }
  }
}
