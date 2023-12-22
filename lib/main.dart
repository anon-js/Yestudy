import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yestudy/viewmodels/bottom_nav_notifier.dart';
import 'package:yestudy/viewmodels/memo_change_notifier.dart';
import 'package:yestudy/viewmodels/memo_editor_notifier.dart';
import 'package:yestudy/views/study_record_view.dart';
import 'package:yestudy/views/today_schedule_view.dart';
import 'package:yestudy/views/todo_list_view.dart';
import 'package:yestudy/wigets/main/calendar_container.dart';
import 'package:yestudy/wigets/main/memo_container.dart';
import 'package:yestudy/wigets/main/study_container.dart';

import 'res/colors.dart';
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
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoEditorRead = ref.read(memoEditorStateNotiferProvider.notifier);
    final memoEditor = ref.watch(memoEditorStateNotiferProvider);
    final memoChangeRead = ref.read(memoChangeStateNotiferProvider.notifier);
    final memoChange = ref.watch(memoChangeStateNotiferProvider);
    final bottomNavRead = ref.read(bottomNavStateNotiferProvider.notifier);
    final bottomNav = ref.watch(bottomNavStateNotiferProvider);
    final double widthSize = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Yestudy',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Builder(
            builder: (context) => IndexedStack(
              index: bottomNav.selectedIndex,
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      width: widthSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            child: SvgPicture.asset('assets/icons/logo.svg'),
                          ),
                          buildStudyContainer(),
                          buildCalendarContainer(),
                          buildMemoContainer(context),
                        ],
                      ),
                    ),
                    Positioned(
                      child: IgnorePointer(
                        ignoring: memoEditor.ignoring,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.ease,
                          opacity: memoEditor.ignoring ? 0 : 1,
                          child: GestureDetector(
                            onTap: () {
                              memoEditorRead.hide();
                              memoEditor.focus.unfocus();
                              if (memoChange.isChange) {
                                memoChangeRead.change();
                              }
                            },
                            child: Container(
                              color: Colors.white54,
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: const Center(
                                  child: SizedBox(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease,
                      bottom: memoEditor.ignoring
                          ? 101
                          : MediaQuery.of(context).padding.bottom + 20,
                      left: memoEditor.ignoring ? 40 : 20,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.ease,
                        width: memoEditor.ignoring
                            ? widthSize - 80
                            : widthSize - 40,
                        height: memoChange.height,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColor.gray1.rawValue),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x80AFAFAF),
                              spreadRadius: 0,
                              blurRadius: memoEditor.blur,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            memoEditorRead.show();
                            Future.delayed(const Duration(milliseconds: 70))
                                .then(
                              (_) => memoEditor.focus.requestFocus(),
                            );
                          },
                          onLongPressStart: (_) {
                            memoChangeRead.change();
                            memoEditorRead.show();
                          },
                          child: memoChange.isChange
                              ? const Center(
                                  child: Text("test"),
                                )
                              : TextField(
                                  enabled: !memoEditor.ignoring,
                                  readOnly: memoEditor.ignoring,
                                  focusNode: memoEditor.focus,
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  style: AppStyle.regular_14px.rawValue,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '메모를 입력해 주세요.',
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                const StudyRecord(),
                const TodaySchedule(),
                const TodoList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            bottomNavRead.select(index);
          },
          currentIndex: bottomNav.selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: AppColor.primary.rawValue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm),
              label: '공부기록',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: '일정',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: '오늘 할 일',
            ),
          ],
        ),
      ),
    );
  }
}
