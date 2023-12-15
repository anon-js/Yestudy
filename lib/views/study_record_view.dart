import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../services/notification_service.dart';
import '../res/strings.dart';
import '../res/colors.dart';
import '../res/text_styles.dart';

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
        backgroundColor: Colors.white,
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
      foregroundColor: AppColor.gray9.rawValue,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        AppString.studyTitle.rawValue,
        style: AppStyle.boldSubTitle.rawValue,
      ),
      bottom: TabBar(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        dividerColor: AppColor.gray4.rawValue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 4,
              color: AppColor.gray9.rawValue,
            ),
          ),
        ),
        labelColor: AppColor.gray9.rawValue,
        unselectedLabelColor: AppColor.gray6.rawValue,
        tabs: [
          Tab(text: AppString.writeTabTitle.rawValue),
          Tab(text: AppString.organizeTabTitle.rawValue),
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
            AppString.writeSubTitle.rawValue,
            style: AppStyle.subTitle.rawValue,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            AppString.writeMainTitle.rawValue,
            style: AppStyle.title.rawValue,
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            key: formKey,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.gray2.rawValue,
              hintText: AppString.writeInputHint.rawValue,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.gray2.rawValue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.primary.rawValue,
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
                AppString.organizeBoldMainTitle.rawValue,
                style: AppStyle.lightTitle.rawValue,
              ),
              Text(
                AppString.organizeMainTitle.rawValue,
                style: AppStyle.title.rawValue,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                AppString.organizeBoldSubTitle.rawValue,
                style: AppStyle.boldSubTitle.rawValue,
              ),
              Text(
                AppString.organizeSubTitle.rawValue,
                style: AppStyle.subTitle.rawValue,
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
          backgroundColor: AppColor.gray2.rawValue,
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary.rawValue),
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
            foregroundColor: AppColor.gray9.rawValue,
            backgroundColor: AppColor.gray2.rawValue,
            disabledForegroundColor: AppColor.gray6.rawValue,
            disabledBackgroundColor: AppColor.gray5.rawValue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            AppString.writeCancelBtn.rawValue,
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
              AppString.noticeTitle.rawValue,
              AppString.noticeDesc.rawValue,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.startBtnBg.rawValue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            AppString.writeStartBtn.rawValue,
            style: TextStyle(
              color: AppColor.startBtn.rawValue,
            ),
          ),
        ),
      ),
    );
  }
}
