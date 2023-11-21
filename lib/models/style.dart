import 'package:flutter/material.dart';
import 'color.dart';

enum MyStyle {
  lightTitle,
  title,
  subTitle,
  boldSubTitle,
  body,
  small,
  link
}

extension MyStyleExtension on MyStyle {
  TextStyle get rawValue {
    switch (this) {
      case MyStyle.lightTitle:
        return TextStyle(
          color: MyColor.textQuaternary.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        );
      case MyStyle.title:
        return TextStyle(
          color: MyColor.textPrimary.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        );
      case MyStyle.subTitle:
        return TextStyle(
          color: MyColor.textQuaternary.rawValue,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        );
      case MyStyle.boldSubTitle:
        return TextStyle(
          color: MyColor.textTertiary.rawValue,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        );
      case MyStyle.body:
        return TextStyle(
          color: MyColor.textSecondary.rawValue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.2,
        );
      case MyStyle.small:
        return TextStyle(
          color: MyColor.textQuaternary.rawValue,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.2,
        );
      case MyStyle.link:
        return const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        );
    }
  }
}
