import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/calendar_date.dart';

class CalendarDateNotifier extends StateNotifier<CalendarDate> {
  CalendarDateNotifier()
      : super(CalendarDate(
          days: DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
          firstDay:
              DateTime(DateTime.now().year, DateTime.now().month, 1).weekday,
          year: DateTime.now().year,
          month: DateTime.now().month,
          selectedDate: DateTime.now().day +
              DateTime(DateTime.now().year, DateTime.now().month, 1).weekday +
              6,
        ));

  void setDay(int index) {
    state = CalendarDate(
        days: state.days,
        firstDay: state.firstDay,
        year: state.year,
        month: state.month,
        selectedDate: index);
  }

  void next() {
    state.year = state.month >= 12 ? ++state.year : state.year;
    state.month = state.month >= 12 ? 1 : ++state.month;
    int firstDay = DateTime(state.year, state.month, 1).weekday;
    state.selectedDate = (firstDay == 7 ? 0 : firstDay) + 7;

    state = CalendarDate(
        days: DateTime(state.year, state.month + 1, 0).day,
        firstDay: firstDay == 7 ? 0 : firstDay,
        year: state.year,
        month: state.month,
        selectedDate: state.selectedDate);
  }

  void prev() {
    state.year = state.month <= 1 ? --state.year : state.year;
    state.month = state.month <= 1 ? 12 : --state.month;
    int firstDay = DateTime(state.year, state.month, 1).weekday;
    state.selectedDate = (firstDay == 7 ? 0 : firstDay) + 7;

    state = CalendarDate(
        days: DateTime(state.year, state.month + 1, 0).day,
        firstDay: firstDay == 7 ? 0 : firstDay,
        year: state.year,
        month: state.month,
        selectedDate: state.selectedDate);
  }
}

final calendarDateStateNotiferProvider =
    StateNotifierProvider<CalendarDateNotifier, CalendarDate>((ref) {
  return CalendarDateNotifier();
});
