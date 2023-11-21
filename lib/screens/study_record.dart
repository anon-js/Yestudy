import 'package:flutter/material.dart';
import 'package:yestudy/models/string.dart';
import 'package:yestudy/service/notification.dart';

import '../models/color.dart';
import '../models/style.dart';

class StudyRecord extends StatefulWidget {
  const StudyRecord({super.key});

  @override
  State<StudyRecord> createState() => _StudyRecordState();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const StudyRecord(),
    );
  }
}

class _StudyRecordState extends State<StudyRecord> {
  @override
  void initState() {
    FlutterLocalNotification.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: TabBarView(
          children: [
            _buildWrite(),
            _buildOrganize(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      foregroundColor: MyColor.textPrimary.rawValue,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        MyString.studyTitle.rawValue,
        style: MyStyle.boldSubTitle.rawValue,
      ),
      bottom: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 4.0,
            ),
          ),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: MyColor.textQuaternary.rawValue,
        tabs: [
          Tab(text: MyString.writeTabTitle.rawValue),
          Tab(text: MyString.organizeTabTitle.rawValue),
        ],
      ),
    );
  }

  Widget _buildWrite() {
    final formKey = GlobalKey<FormState>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyString.writeSubTitle.rawValue,
            style: MyStyle.subTitle.rawValue,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            MyString.writeMainTitle.rawValue,
            style: MyStyle.title.rawValue,
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            key: formKey,
            decoration: InputDecoration(
              filled: true,
              fillColor: MyColor.bg.rawValue,
              hintText: MyString.writeInputHint.rawValue,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: MyColor.bg.rawValue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: MyColor.primary.rawValue,
                ),
              ),
            ),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              _buildCancelBtn(),
              const SizedBox(
                width: 10,
              ),
              _buildStartBtn(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrganize() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                MyString.organizeBoldMainTitle.rawValue,
                style: MyStyle.lightTitle.rawValue,
              ),
              Text(
                MyString.organizeMainTitle.rawValue,
                style: MyStyle.title.rawValue,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                MyString.organizeBoldSubTitle.rawValue,
                style: MyStyle.boldSubTitle.rawValue,
              ),
              Text(
                MyString.organizeSubTitle.rawValue,
                style: MyStyle.subTitle.rawValue,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          _buildProgressBar(subject: '수학', time: '2시간 30분', value: 0.58),
          _buildProgressBar(subject: 'DB', time: '1시간 10분', value: 0.27),
          _buildProgressBar(subject: '문학', time: '40분', value: 0.15),
        ],
      ),
    );
  }

  Widget _buildProgressBar(
      {required String subject, required String time, required double value}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(subject),
            Text(time),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        LinearProgressIndicator(
          // 260 / 140
          value: value,
          minHeight: 32,
          backgroundColor: MyColor.bg.rawValue,
          valueColor: AlwaysStoppedAnimation<Color>(MyColor.primary.rawValue),
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget _buildCancelBtn() {
    return Expanded(
      child: SizedBox(
        height: 42,
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            foregroundColor: MyColor.textSecondary.rawValue,
            backgroundColor: MyColor.bg.rawValue,
            disabledForegroundColor: MyColor.textQuaternary.rawValue,
            disabledBackgroundColor: MyColor.textQuinary.rawValue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            MyString.writeCancelBtn.rawValue,
          ),
        ),
      ),
    );
  }

  Widget _buildStartBtn() {
    return Expanded(
      child: SizedBox(
        height: 42,
        child: ElevatedButton(
          onPressed: () async {
            await FlutterLocalNotification.requestNotificationPermission();
            await FlutterLocalNotification.showNotification(
              MyString.noticeTitle.rawValue,
              MyString.noticeDesc.rawValue,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColor.startBtnBg.rawValue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            MyString.writeStartBtn.rawValue,
            style: TextStyle(
              color: MyColor.startBtn.rawValue,
            ),
          ),
        ),
      ),
    );
  }
}
