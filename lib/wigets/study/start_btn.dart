import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../services/notification_service.dart';

Expanded buildStartBtn() {
  return Expanded(
    child: SizedBox(
      height: 42,
      child: ElevatedButton(
        onPressed: () async {
          await FlutterLocalNotification.requestNotificationPermission();
          await FlutterLocalNotification.showNotification(
            AppString.noticeTitle.rawValue,
            AppString.noticeDesc.rawValue,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.startBtnBg.rawValue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          AppString.writeStartBtn.rawValue,
          style: TextStyle(
            color: AppColor.startBtn.rawValue,
          ),
        ),
      ),
    ),
  );
}
