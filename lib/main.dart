import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yestudy/views/study_record_view.dart';
import 'package:yestudy/views/today_schedule_view.dart';
import 'package:yestudy/views/todo_list_view.dart';

import 'res/colors.dart';
import 'res/strings.dart';
import 'res/text_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MaterialApp(
        title: 'Yestudy',
        theme: ThemeData(
          fontFamily: 'Pretendard',
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const ProviderScope(
          child: MyApp(),
        )),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final memoEdiorRead = ref.read(memoEditorStateNotiferProvider.notifier);
    // final memoEditor = ref.watch(memoEditorStateNotiferProvider);
    final double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              width: widthSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: SvgPicture.asset('assets/icons/logo.svg'),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(4, 0, 0, 10),
                                child: Text(
                                  AppString.studyTitle.rawValue,
                                  style: AppStyle.title.rawValue,
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const StudyRecord(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.bg.rawValue,
                                    elevation: 0,
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
                                    side: BorderSide(color: AppColor.border.rawValue),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: SvgPicture.asset(
                                          'assets/icons/book.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 110,
                                            child: Text(
                                              AppString.studyMainText.rawValue,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: AppStyle.body.rawValue,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              AppString.studySubText.rawValue,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: AppStyle.small.rawValue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(4, 0, 0, 10),
                                child: Text(
                                  AppString.calendarTitle.rawValue,
                                  style: AppStyle.title.rawValue,
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const TodaySchedule(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.bg.rawValue,
                                    elevation: 0,
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
                                    side: BorderSide(color: AppColor.border.rawValue),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: SvgPicture.asset(
                                          'assets/icons/calendar.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 110,
                                            child: Text(
                                              AppString.calendarMainText.rawValue,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: AppStyle.body.rawValue,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              AppString.calendarSubText.rawValue,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: AppStyle.small.rawValue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                              child: Text(
                                AppString.todoTitle.rawValue,
                                style: AppStyle.title.rawValue,
                              ),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TodoList(),
                                  ),
                                ),
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: AppColor.primary.rawValue,
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                              ),
                              child: Text(
                                AppString.todoLink.rawValue,
                                style: AppStyle.link.rawValue,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 70,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.bg.rawValue,
                                    elevation: 0,
                                    side: BorderSide(color: AppColor.border.rawValue),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  icon: Container(
                                    width: 22,
                                    height: 22,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                                        color: AppColor.border.rawValue),
                                    child: SvgPicture.asset(
                                      'assets/icons/plus.svg',
                                      width: 14,
                                      height: 14,
                                      colorFilter: ColorFilter.mode(
                                          AppColor.placeholder.rawValue, BlendMode.srcIn),
                                    ),
                                  ),
                                  label: Text(
                                    AppString.todoBoxAddLabel.rawValue,
                                    style: TextStyle(
                                      color: AppColor.placeholder.rawValue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 70,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.bg.rawValue,
                                    elevation: 0,
                                    side: BorderSide(color: AppColor.border.rawValue),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  icon: Container(
                                    width: 22,
                                    height: 22,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                                        color: AppColor.border.rawValue),
                                    child: SvgPicture.asset(
                                      'assets/icons/plus.svg',
                                      width: 14,
                                      height: 14,
                                      colorFilter: ColorFilter.mode(
                                          AppColor.placeholder.rawValue, BlendMode.srcIn),
                                    ),
                                  ),
                                  label: Text(
                                    AppString.todoBoxAddLabel.rawValue,
                                    style: TextStyle(
                                      color: AppColor.placeholder.rawValue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.memoTitle.rawValue,
                          style: TextStyle(
                            color: AppColor.textPrimary.rawValue,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => {},
                          style: TextButton.styleFrom(
                            foregroundColor: AppColor.primary.rawValue,
                            iconColor: AppColor.primary.rawValue,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                          icon: SvgPicture.asset('assets/icons/plus.svg'),
                          label: Text(
                            AppString.memoLink.rawValue,
                            style: AppStyle.link.rawValue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
