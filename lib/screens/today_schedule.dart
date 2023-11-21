import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/style.dart';

class TodaySchedule extends StatefulWidget {
  const TodaySchedule({super.key});

  @override
  State<TodaySchedule> createState() => _TodayScheduleState();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TodaySchedule(),
    );
  }
}

class _TodayScheduleState extends State<TodaySchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            getToday(),
            style: MyStyle.boldSubTitle.rawValue,
          ),
        ),
        body: const Column(
          children: [
            Text(
              'Test page',
            ),
          ],
        ));
  }

  // var now = DateTime.now();
  // var firstTime = DateTime(now.year, now.month, now.day - (now.weekday - 1));
  // var lastTime = DateTime(now.year, now.month, now.day + (7 - now.weekday));
  // 첫날과 마지막 날 구하는 법

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy년 MM월');
    return formatter.format(now);
  }
}
