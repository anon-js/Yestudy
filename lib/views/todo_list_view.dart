import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/strings.dart';
import '../res/text_styles.dart';

List<String> todoOptions = [
  '할 일은 여기에 표시돼요1',
  '할 일은 여기에 표시돼요2',
  '할 일은 여기에 표시돼요3'
];
String todoSelectedOption = todoOptions[0];
List<String> doneOptions = ['할 일을 완료하면 여기에 표시돼요!'];
String doneSelectedOption = doneOptions[0];

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TodoList(),
    );
  }
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: TabBarView(
          children: [
            _buildTodoList(),
            _buildDoneList(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        AppString.todoTitle.rawValue,
        style: AppStyle.boldSubTitle.rawValue,
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
        unselectedLabelColor: AppColor.textQuaternary.rawValue,
        tabs: [
          Tab(text: AppString.todoTabTitle.rawValue),
          Tab(text: AppString.doneTabTitle.rawValue),
        ],
      ),
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(index.toString()),
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.delete,
              size: 28,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: AppColor.primary.rawValue,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.edit,
              size: 28,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              //
            }
            if (direction == DismissDirection.endToStart) {
              //오른쪽에서 왼쪽으로
            }
          },
          child: _buildTodoItem(false, index),
        );
      },
    );
  }

  Widget _buildDoneList() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return _buildTodoItem(true, index);
      },
    );
  }

  Widget _buildTodoItem(bool isCheck, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: RadioListTile(
        value: todoOptions[index],
        groupValue: todoSelectedOption,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onChanged: null,
        tileColor: AppColor.bg.rawValue,
        selectedTileColor: AppColor.primary.rawValue,
        selected: isCheck || false,
        title: Text(
          AppString.todoItemText.rawValue,
        ),
      ),
    );
  }
}
