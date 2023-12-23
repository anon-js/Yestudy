import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../res/colors.dart';
import '../../viewmodels/calendar_date_notifier.dart';

GridView buildCalendarGrid(BuildContext context, WidgetRef ref) {
  final calendarDateRead = ref.read(calendarDateStateNotiferProvider.notifier);
  final calendarDate = ref.watch(calendarDateStateNotiferProvider);
  final week = ['일', '월', '화', '수', '목', '금', '토'];

  return GridView.custom(
    shrinkWrap: true,
    padding: const EdgeInsets.all(20),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 7,
    ),
    childrenDelegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            if (index > calendarDate.firstDay + 6 &&
                index < calendarDate.days + calendarDate.firstDay + 7) {
              calendarDateRead.setDay(index);
            }
          },
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              calendarDateRead.prev();
            } else if (details.velocity.pixelsPerSecond.dx < 0) {
              calendarDateRead.next();
            }
          },
          child: Container(
            height: index < 7 ? 20 : 100,
            padding: const EdgeInsets.fromLTRB(0, 2, 4, 4),
            decoration: BoxDecoration(
              border: Border(
                top: index < 7
                    ? const BorderSide(style: BorderStyle.none)
                    : BorderSide(color: AppColor.gray_300.rawValue),
                right: index < 7 || index % 7 == 6
                    ? const BorderSide(style: BorderStyle.none)
                    : BorderSide(color: AppColor.gray_300.rawValue),
              ),
            ),
            child: Align(
              alignment:
                  index < 7 ? Alignment.bottomCenter : Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: index == calendarDate.selectedDate
                        ? AppColor.primary_500.rawValue
                        : null,
                    shape: BoxShape.circle),
                child: Text(
                  index < 7
                      ? week[index]
                      : index > calendarDate.firstDay + 6 &&
                              index <
                                  calendarDate.days + calendarDate.firstDay + 7
                          ? '${index - (calendarDate.firstDay + 6)}'
                          : '',
                  style: TextStyle(
                      color: index == calendarDate.selectedDate
                          ? Colors.white
                          : index % 7 == 0
                              ? Colors.red
                              : index % 7 == 6
                                  ? Colors.blue
                                  : AppColor.gray_800.rawValue),
                ),
              ),
            ),
          ),
        );
      },
      childCount: calendarDate.days + calendarDate.firstDay + 7 <= 42 ? 42 : 49,
    ),
  );
}
