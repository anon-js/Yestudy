import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/colors.dart';
import '../res/text_styles.dart';

Container buildStudyContainer() {
  return Container(
    width: 350,
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
    decoration: BoxDecoration(
      color: AppColor.gray2.rawValue,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColor.gray1.rawValue),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/book.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 6),
                Text(
                  '정보처리산업기사',
                  style: AppStyle.boldSubTitle.rawValue,
                ),
              ],
            ),
            Text(
              'D+7',
              style: AppStyle.dday.rawValue,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '정말 수고 많으셨어요!',
              style: AppStyle.desc.rawValue,
            ),
          ],
        ),
      ],
    ),
  );
}
