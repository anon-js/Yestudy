import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yestudy/wigets/common/tab_bar.dart';

import '../services/notification_service.dart';
import '../res/strings.dart';
import '../res/colors.dart';
import '../res/text_styles.dart';
import '../wigets/study/cancel_btn.dart';
import '../wigets/study/start_btn.dart';

class Subject {
  final String name;
  final String time;
  final double ratio;

  const Subject({
    required this.name,
    required this.time,
    required this.ratio,
  });
}

class StudyRecord extends ConsumerStatefulWidget {
  const StudyRecord({super.key});

  @override
  StudyRecordState createState() => StudyRecordState();

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

class StudyRecordState extends ConsumerState<StudyRecord> {
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
        appBar: buildTabBar(
            AppString.studyTitle.rawValue,
            AppString.writeTabTitle.rawValue,
            AppString.organizeTabTitle.rawValue),
        body: TabBarView(
          children: [
            _buildWrite(),
            _buildOrganize(),
          ],
        ),
      ),
    );
  }

  Container _buildWrite() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
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
              fillColor: AppColor.gray_100.rawValue,
              hintText: AppString.writeInputHint.rawValue,
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.gray_100.rawValue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.primary_500.rawValue,
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
              buildCancelBtn(),
              const SizedBox(
                width: 10,
              ),
              buildStartBtn(),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildOrganize() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStudyTimeContainer(),
          const SizedBox(height: 20),
          _buildTodaysRecs(),
          const SizedBox(height: 32),
          _buildThingAsk(),
        ],
      ),
    );
  }

  Container _buildStudyTimeContainer() {
    return Container(
      height: 370,
      decoration: BoxDecoration(
        color: AppColor.gray_100.rawValue,
        borderRadius: BorderRadius.circular(10),
      ),
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
                    '${AppString.organizeBoldMainTitle.rawValue} ',
                    style: AppStyle.bold_24px.rawValue
                        .copyWith(color: AppColor.gray_700.rawValue),
                  ),
                  Text(
                    AppString.organizeMainTitle.rawValue,
                    style: AppStyle.bold_24px.rawValue
                        .copyWith(color: AppColor.primary_500.rawValue),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    AppString.organizeBoldSubTitle.rawValue,
                    style: AppStyle.medium_20px.rawValue
                        .copyWith(color: AppColor.gray_600.rawValue),
                  ),
                  Text(
                    AppString.organizeSubTitle.rawValue,
                    style: AppStyle.medium_20px.rawValue
                        .copyWith(color: AppColor.gray_600.rawValue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Center(
              child: _buildGraph([
                const Subject(name: 'DB', time: '1h 10m', ratio: 0.5),
                const Subject(name: '문학', time: '40m', ratio: 0.14),
                const Subject(name: '사회', time: '45m', ratio: 0.2),
                const Subject(name: '수학', time: '2h 30m', ratio: 0.9),
                const Subject(name: 'HTML', time: '50m', ratio: 0.27),
                const Subject(name: '소프트웨어', time: '1h 50m', ratio: 0.8),
                const Subject(name: '음악', time: '1h 55m', ratio: 0.82),
                const Subject(name: '개발', time: '3h', ratio: 1),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildTodaysRecs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '오늘의 추천',
          style: AppStyle.semiBold_20px.rawValue,
        ),
        const SizedBox(height: 4),
        Text(
          '지금까지 수학과 DB를 열심히 공부했으니\n오늘은 문학을 공부해보는 건 어때요?',
          style: AppStyle.regular_16px.rawValue
              .copyWith(color: AppColor.gray_600.rawValue),
        ),
      ],
    );
  }

  Column _buildThingAsk() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '어려움을 극복할 때마다 더 강해진다.',
          style: AppStyle.regular_16px.rawValue,
        ),
        Text(
          '- 아놀드 슈워제네거',
          style: AppStyle.regular_14px.rawValue
              .copyWith(color: AppColor.gray_600.rawValue),
        ),
      ],
    );
  }

  ListView _buildGraph(List<Subject> subjects) {
    subjects.sort((a, b) => a.ratio.compareTo(b.ratio));
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                subjects[i].time,
                style: subjects[i].ratio != subjects.last.ratio
                    ? AppStyle.regular_12px.rawValue
                        .copyWith(color: AppColor.gray_500.rawValue)
                    : AppStyle.regular_12px.rawValue
                        .copyWith(color: AppColor.primary_800.rawValue),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 35,
                height: 190 * subjects[i].ratio,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: subjects[i].ratio != subjects.last.ratio
                      ? AppColor.gray_400.rawValue
                      : AppColor.primary_500.rawValue,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                ),
              ),
              Text(
                subjects[i].name,
                style: AppStyle.regular_12px.rawValue
                    .copyWith(color: AppColor.gray_700.rawValue),
              ),
            ],
          );
        });
  }
}
