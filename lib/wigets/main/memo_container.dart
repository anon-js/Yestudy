import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../res/text_styles.dart';

Container buildMemoContainer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColor.yellow_50.rawValue,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/memo.svg',
                width: 24,
                height: 24,
              ),
            ),

            const SizedBox(width: 6),
            Text(
              AppString.memoTitle.rawValue,
              style: AppStyle.semiBold_20px.rawValue,
            ),
          ],
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('메모 추가'),
                  content: const Text('기능을 구현하고 있어요.'),
                  actions: [
                    CupertinoDialogAction(
                      textStyle: TextStyle(color: AppColor.primary_500.rawValue),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('닫기'),
                    ),
                  ],
                ),
              );
            },
            borderRadius: BorderRadius.circular(50),
            padding: const EdgeInsets.all(5),
            color: AppColor.gray_600.rawValue,
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 14,
              height: 14,
            ),
          ),
        ),
      ],
    ),
  );
}
