import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/colors.dart';
import '../../res/text_styles.dart';

Container buildStudyContainer() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColor.primary_50.rawValue,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/book.svg',
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '정보처리산업기사',
                    style: AppStyle.semiBold_20px.rawValue,
                  ),
                  Text(
                    'D+19',
                    style: AppStyle.semiBold_20px.rawValue
                        .copyWith(color: AppColor.primary_500.rawValue),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '공부한 시간 ',
                        style: AppStyle.medium_16px.rawValue
                            .copyWith(color: AppColor.gray_500.rawValue),
                      ),
                      Text(
                        '23h 59m 59s',
                        style: AppStyle.medium_16px.rawValue
                            .copyWith(color: AppColor.gray_700.rawValue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '23h 59h 59s',
                        style: AppStyle.regular_12px.rawValue
                            .copyWith(color: AppColor.gray_500.rawValue),
                      ),
                      SvgPicture.asset(
                        'assets/icons/up.svg',
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
