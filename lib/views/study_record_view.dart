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
        style: AppStyle.semiBold_20px.rawValue,
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.writeSubTitle.rawValue,
            style: AppStyle.regular_20px.rawValue,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            AppString.writeMainTitle.rawValue,
            style: AppStyle.semiBold_24px.rawValue,
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
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
    return Column(
      children: [
        Container(
          height: 370,
          decoration: BoxDecoration(
            color: AppColor.gray2.rawValue,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.organizeBoldMainTitle.rawValue,
                        style: AppStyle.bold_24px.rawValue,
                      ),
                      Text(
                        AppString.organizeMainTitle.rawValue,
                        style: AppStyle.bold_24px.rawValue,
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
                        style: AppStyle.medium_20px.rawValue,
                      ),
                      Text(
                        AppString.organizeSubTitle.rawValue,
                        style: AppStyle.medium_20px.rawValue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  _buildProgressBar(
                      subject: '수학', time: '2h 30m', value: 0.58),
                  _buildProgressBar(
                      subject: 'DB', time: '1h 10m', value: 0.27),
                  _buildProgressBar(subject: '문학', time: '40m', value: 0.15),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(
      {required String subject, required String time, required double value}) {
    return Column(
      children: [
        Text(time),
        const SizedBox(
          height: 4,
        ),
        CircularProgressIndicator(
          value: value,
          backgroundColor: AppColor.gray2.rawValue,
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary.rawValue),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(subject),
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
