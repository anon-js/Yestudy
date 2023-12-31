import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../res/text_styles.dart';

Container buildCalendarContainer() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColor.red_50.rawValue,
                shape: BoxShape.circle,
              ),
              child: Stack(
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
                          color: AppColor.gray_500.rawValue,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 6),
            Text(
              AppString.calendarTitle.rawValue,
              style: AppStyle.semiBold_20px.rawValue,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '예스터디 완성 시키기',
              style: AppStyle.medium_16px.rawValue,
            ),
            const SizedBox(width: 4),
            Text(
              '외 2개',
              style: AppStyle.regular_16px.rawValue
                  .copyWith(color: AppColor.gray_500.rawValue),
            ),
          ],
        ),
      ],
    ),
  );
}
