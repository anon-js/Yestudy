import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../res/text_styles.dart';

Container buildCalendarContainer() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
    decoration: BoxDecoration(
      color: AppColor.gray2.rawValue,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColor.gray1.rawValue),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                Positioned(
                  bottom: 1,
                  child: Text(
                    DateFormat('dd').format(DateTime.now()),
                    style: TextStyle(
                        color: AppColor.gray6.rawValue,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 6),
            Text(
              AppString.calendarTitle.rawValue,
              style: AppStyle.boldSubTitle.rawValue,
            ),
            const SizedBox(width: 20),
            Container(
              width: 1,
              height: 22,
              color: AppColor.gray5.rawValue,
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                Text(
                  '예스터디 완성 시키기',
                  style: AppStyle.body.rawValue,
                ),
                const SizedBox(width: 4),
                Text(
                  '외 2개',
                  style: AppStyle.bodyDesc.rawValue,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/todo.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 6),
            Text(
              AppString.todoTitle.rawValue,
              style: AppStyle.boldSubTitle.rawValue,
            ),
            const SizedBox(width: 16),
            Container(
              width: 1,
              height: 22,
              color: AppColor.gray5.rawValue,
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                Text(
                  '메인 화면 구현하기',
                  style: AppStyle.body.rawValue,
                ),
                const SizedBox(width: 4),
                Text(
                  '외 5개',
                  style: AppStyle.bodyDesc.rawValue,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
