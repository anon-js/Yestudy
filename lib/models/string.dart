enum MyString {
  // StudyRecord
  studyTitle,
  studyMainText,
  studySubText,
  writeTabTitle,
  organizeTabTitle,
  writeMainTitle,
  writeSubTitle,
  writeInputHint,
  writeInputValue,
  writeStartBtn,
  writePauseBtn,
  writeCancelBtn,
  organizeBoldMainTitle,
  organizeMainTitle,
  organizeBoldSubTitle,
  organizeSubTitle,
  noticeTitle,
  noticeDesc,
  // Calendar
  calendarTitle,
  calendarMainText,
  calendarSubText,
  // Todo
  todoTitle,
  todoLink,
  todoBoxAddLabel,
  todoTabTitle,
  doneTabTitle,
  todoItemText,
  doneItemText,
  // Memo
  memoTitle,
  memoLink,
  memoInputHint,
  memoInputValue,
}

extension MyStringExtension on MyString {
  String get rawValue {
    switch (this) {
      // StudyRecord
      case MyString.studyTitle:
        return '공부하기';
      case MyString.studyMainText:
        return '10일 남았어요!';
      case MyString.studySubText:
        return '3시간 30분 (-50분)';
      case MyString.writeTabTitle:
        return '기록';
      case MyString.organizeTabTitle:
        return '정리';
      case MyString.writeMainTitle:
        return '민호님 화이팅 :)';
      case MyString.writeSubTitle:
        return '미래를 위한 노력,';
      case MyString.writeInputHint:
        return '공부할 과목을 입력해 주세요.';
      case MyString.writeInputValue:
        return '';
      case MyString.writeStartBtn:
        return '시작';
      case MyString.writePauseBtn:
        return '중지';
      case MyString.writeCancelBtn:
        return '취소';
      case MyString.organizeBoldMainTitle:
        return '총 공부 시간:';
      case MyString.organizeMainTitle:
        return '4시간 20분';
      case MyString.organizeBoldSubTitle:
        return '수학';
      case MyString.organizeSubTitle:
        return '을 제일 많이 공부했어요.';
      case MyString.noticeTitle:
        return '국어 공부를 시작했어요.';
      case MyString.noticeDesc:
        return '당신의 노력을 기록중이에요!';
      // Calendar
      case MyString.calendarTitle:
        return '오늘 일정';
      case MyString.calendarMainText:
        return '코딩하기';
      case MyString.calendarSubText:
        return '외 2개';
      // Todo
      case MyString.todoTitle:
        return '오늘 할 일';
      case MyString.todoLink:
        return '더보기';
      case MyString.todoBoxAddLabel:
        return '할 일 추가하기';
      case MyString.todoTabTitle:
        return 'To-do';
      case MyString.doneTabTitle:
        return 'Done';
      case MyString.todoItemText:
        return '할 일은 여기에 표시돼요!';
      case MyString.doneItemText:
        return '할 일은 여기에 표시돼요!';
      case MyString.memoTitle:
        return '메모';
      case MyString.memoLink:
        return '메모 추가';
      case MyString.memoInputHint:
        return '메모를 입력해 주세요.';
      case MyString.memoInputValue:
        return '메모가 입력되면 이곳에 표시됩니다!';
    }
  }
}
