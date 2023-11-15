import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yestudy/screens/study_record.dart';
import 'package:yestudy/screens/today_schedule.dart';
import 'package:yestudy/screens/todo_list.dart';

const Color primaryColor = Color(0xff1D1D1F);
const Color backgroundColor = Color(0xffF5F5F7);
const Color borderColor = Color(0xffEEEEEE);
const Color textColor = Color(0xff222222);
const Color secondaryTextColor = Color(0xff888888);
const Color linkColor = Color(0xff3A5FCC);
const Color placeholderColor = Color(0xff999999);

const TextStyle headingTextStyle = TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.w600,
  fontSize: 24,
);

const TextStyle bodyTextStyle = TextStyle(
  color: textColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

const TextStyle smallTextStyle = TextStyle(
  color: secondaryTextColor,
  fontSize: 12,
);

const TextStyle linkTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

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
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  bool isPeeked = false;
  double blurSigma = 0.0;
  double topPosition = 440.0;

  void setPeeked() {
    isPeeked
        ? setState(() {
      FocusScope.of(context).unfocus();
      blurSigma = 0.0;
      isPeeked = false;
      topPosition = 440;
    })
        : setState(() {
      blurSigma = 12.0;
      isPeeked = true;
      topPosition = (MediaQuery
          .of(context)
          .size
          .height / 2) - 280;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery
        .of(context)
        .size
        .width;
    final double heightSize = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: widthSize,
            height: heightSize,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  width: widthSize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLogoSection(),
                      _buildContainer('studyAndTodaySchedule'),
                      _buildContainer('todo'),
                      _buildMemoTitleBox(),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  top: topPosition,
                  width: widthSize,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut,
                  child: _buildContainer('memo'),
                ),
              ],
            ),
          ),
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

  Widget _buildContainer(String name) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 32, 20, 0),
      child: name == 'studyAndTodaySchedule'
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildWrapper(
              title: '공부하기',
              nextPage: const StudyRecord(),
              icon: 'book',
              mainText: '10일 남았어요!',
              subText: '어제보다 12분 더 공부했어요.'),
          const SizedBox(width: 10),
          _buildWrapper(
              title: '오늘 일정',
              nextPage: const TodaySchedule(),
              icon: 'calendar',
              mainText: '일정은 여기에 표시됩니다.',
              subText: '외 2개'),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: name == 'todo'
            ? [
          _buildTodoTitleBox(),
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
          _buildMemoInputBackgroundBlur(),
          _buildMemoInputSection(),
        ],
      ),
    );
  }

  Widget _buildWrapper({required String title,
    required Widget nextPage,
    required String icon,
    required String mainText,
    required String subText}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 10),
            child: Text(
              title,
              style: headingTextStyle,
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
                backgroundColor: backgroundColor,
                elevation: 0,
                side: const BorderSide(color: borderColor),
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
                        width: 105,
                        child: Text(
                          mainText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: bodyTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          subText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: smallTextStyle,
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

  Widget _buildTodoTitleBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: const Text(
            '오늘 할 일',
            style: headingTextStyle,
          ),
        ),
        TextButton(
          onPressed: () =>
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TodoList(),
              ),
            ),
          },
          style: TextButton.styleFrom(
            foregroundColor: linkColor,
          ),
          child: const Text(
            '더보기',
            style: linkTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildTodoAddBtn() {
    return Expanded(
      child: Container(
        width: 170,
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            side: const BorderSide(color: borderColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Container(
            width: 22,
            height: 22,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: borderColor),
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 14,
              height: 14,
              colorFilter:
              const ColorFilter.mode(placeholderColor, BlendMode.srcIn),
            ),
          ),
          label: const Text(
            '할 일 추가하기',
            style: TextStyle(
              color: placeholderColor,
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
      margin: const EdgeInsets.fromLTRB(25, 32, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '메모',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          TextButton.icon(
            onPressed: null,
            style: TextButton.styleFrom(
              foregroundColor: linkColor,
              iconColor: linkColor,
            ),
            icon: SvgPicture.asset('assets/icons/plus.svg'),
            label: const Text(
              '메모 추가',
              style: linkTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemoInputBackgroundBlur() {
    return AnimatedOpacity(
      opacity: blurSigma > 0.0 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 150),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildMemoInputSection() {
    return AnimatedContainer(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: isPeeked ? 270.0 : 100.0,
      margin: const EdgeInsets.only(bottom: 20),
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      curve: Curves.easeInOut,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        onTap: () => {setPeeked()},
        controller: TextEditingController(text: '메모가 입력되면 이곳에 표시됩니다!'),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '메모를 입력해 주세요.',
        ),
        style: const TextStyle(
          color: primaryColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
