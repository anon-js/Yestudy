import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yestudy/res/colors.dart';
import 'package:yestudy/wigets/calendar/calendar_grid.dart';

import '../res/text_styles.dart';
import '../viewmodels/calendar_date_notifier.dart';
import '../wigets/calendar/schedule.dart';

class TodaySchedule extends ConsumerWidget {
  const TodaySchedule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarDateNav = ref.watch(calendarDateStateNotiferProvider);

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '${calendarDateNav.year}월 ${calendarDateNav.month}일',
            style: AppStyle.semiBold_20px.rawValue,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCalendarGrid(context, ref),
            Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.gray4.rawValue,
              ),
            ),
            const SizedBox(height: 16),
            buildSchedule(context, ref),
          ],
        ),
      ),
    );
  }
}
