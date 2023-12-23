import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../res/text_styles.dart';

Container buildTodoContainer() {
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
                color: AppColor.primary_50.rawValue,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/todo.svg',
                width: 24,
                height: 24,
              ),
            ),

            const SizedBox(width: 6),
            Text(
              AppString.todoTitle.rawValue,
              style: AppStyle.semiBold_20px.rawValue,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '메인 화면 구현하기',
              style: AppStyle.medium_16px.rawValue,
            ),
            const SizedBox(width: 4),
            Text(
              '외 5개',
              style: AppStyle.regular_16px.rawValue
                  .copyWith(color: AppColor.gray_500.rawValue),
            ),
          ],
        ),
      ],
    ),
  );
}
