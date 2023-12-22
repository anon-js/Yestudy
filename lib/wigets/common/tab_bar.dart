import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../res/text_styles.dart';

PreferredSizeWidget buildTabBar(
    String title, String firstTab, String secondTab) {
  return AppBar(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
      style: AppStyle.semiBold_20px.rawValue,
    ),
    bottom: TabBar(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      dividerColor: AppColor.gray4.rawValue,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppStyle.medium_16px.rawValue,
      unselectedLabelStyle: AppStyle.regular_16px.rawValue.copyWith(
        color: AppColor.gray7.rawValue,
      ),
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
        Tab(text: firstTab),
        Tab(text: secondTab),
      ],
    ),
  );
}
