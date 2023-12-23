import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';

Expanded buildCancelBtn() {
  return Expanded(
    child: SizedBox(
      height: 42,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.gray_800.rawValue,
          backgroundColor: AppColor.gray_100.rawValue,
          disabledForegroundColor: AppColor.gray_500.rawValue,
          disabledBackgroundColor: AppColor.gray_400.rawValue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          AppString.writeCancelBtn.rawValue,
        ),
      ),
    ),
  );
}
