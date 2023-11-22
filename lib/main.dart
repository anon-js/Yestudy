import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yestudy/views/study_record_view.dart';
import 'package:yestudy/views/today_schedule_view.dart';
import 'package:yestudy/views/todo_list_view.dart';
import 'package:yestudy/viewmodels/memo_editor_notifier.dart';

import 'res/colors.dart';
import 'models/memo_editor.dart';
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
    final memoEdiorRead = ref.read(memoEditorStateNotiferProvider.notifier);
    final memoEditor = ref.watch(memoEditorStateNotiferProvider);
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
                  _buildLogoSection(),
                  _buildContainer('studyAndTodaySchedule', context, memoEditor,
                      memoEdiorRead),
                  _buildContainer('todo', context, memoEditor, memoEdiorRead),
                  _buildMemoTitleBox(),
                ],
              ),
            ),
            AnimatedPositioned(
              top: memoEditor.topPosition,
              width: widthSize,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child:
                  _buildContainer('memo', context, memoEditor, memoEdiorRead),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: SvgPicture.asset('assets/icons/logo.svg'),
    );
  }

  Widget _buildContainer(String name, BuildContext context,
      MemoEditor memoEditor, MemoEditorNotifier memoEditorRead) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
      child: name == 'studyAndTodaySchedule'
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWrapper(
                  title: AppString.studyTitle.rawValue,
                  nextPage: const StudyRecord(),
                  icon: 'book',
                  mainText: AppString.studyMainText.rawValue,
                  subText: AppString.studySubText.rawValue,
                  context: context,
                ),
                const SizedBox(width: 10),
                _buildWrapper(
                  title: AppString.calendarTitle.rawValue,
                  nextPage: const TodaySchedule(),
                  icon: 'calendar',
                  mainText: AppString.calendarMainText.rawValue,
                  subText: AppString.calendarSubText.rawValue,
                  context: context,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: name == 'todo'
                  ? [
                      _buildTodoTitleBox(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTodoAddBtn(),
                          const SizedBox(width: 10),
                          _buildTodoAddBtn(),
                        ],
                      ),
                    ]
                  : [
                      _buildMemoInputBackgroundBlur(memoEditor),
                      _buildMemoInputSection(
                          context, memoEditor, memoEditorRead),
                    ],
            ),
    );
  }

  Widget _buildWrapper(
      {required String title,
      required Widget nextPage,
      required String icon,
      required String mainText,
      required String subText,
      required BuildContext context}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(4, 0, 0, 10),
            child: Text(
              title,
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
                    builder: (context) => nextPage,
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SvgPicture.asset(
                      'assets/icons/$icon.svg',
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
                          mainText,
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
                          subText,
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
    );
  }

  Widget _buildTodoTitleBox(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildTodoAddBtn() {
    return Expanded(
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
    );
  }

  Widget _buildMemoTitleBox() {
    return Container(
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
    );
  }

  Widget _buildMemoInputBackgroundBlur(MemoEditor memoEditor) {
    return AnimatedOpacity(
      opacity: memoEditor.blur > 0.0 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 150),
      child: BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: memoEditor.blur, sigmaY: memoEditor.blur),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildMemoInputSection(BuildContext context, MemoEditor memoEditor,
      MemoEditorNotifier memoEditorRead) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      height: memoEditor.memoHeight,
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.border.rawValue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      curve: Curves.easeInOut,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        onTap: () => {
          memoEditorRead.show((MediaQuery.of(context).size.height / 2) - 280)
        },
        controller:
            TextEditingController(text: AppString.memoInputValue.rawValue),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: AppString.memoInputHint.rawValue,
        ),
        style: TextStyle(
          color: AppColor.textPrimary.rawValue,
          fontSize: 14,
        ),
      ),
    );
  }
}
