import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/colors.dart';
import '../../res/text_styles.dart';
import '../../viewmodels/calendar_date_notifier.dart';

Container buildSchedule(BuildContext context, WidgetRef ref) {
  final calendarDate = ref.watch(calendarDateStateNotiferProvider);

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${calendarDate.selectedDate - (calendarDate.firstDay + 6)}일 ${[
            '월',
            '화',
            '수',
            '목',
            '금',
            '토',
            '일'
          ][DateTime.now().weekday - 1]}요일',
          style: AppStyle.semiBold_20px.rawValue,
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('일정 추가'),
                  content: const Text('기능을 구현하고 있어요.'),
                  actions: [
                    CupertinoDialogAction(
                      textStyle: TextStyle(color: AppColor.primary_500.rawValue),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('닫기'),
                    ),
                  ],
                ),
              );
            },
            borderRadius: BorderRadius.circular(50),
            padding: const EdgeInsets.all(5),
            color: AppColor.gray_600.rawValue,
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 14,
              height: 14,
            ),
          ),
        ),
      ],
    ),
  );
}
