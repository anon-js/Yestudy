enum AppString {
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

extension AppStringExtension on AppString {
  String get rawValue {
    switch (this) {
      // StudyRecord
      case AppString.studyTitle:
        return '공부하기';
      case AppString.studyMainText:
        return '10일 남았어요!';
      case AppString.studySubText:
        return '3시간 30분 (-50분)';
      case AppString.writeTabTitle:
        return '기록';
      case AppString.organizeTabTitle:
        return '정리';
      case AppString.writeMainTitle:
        return '민호님 화이팅 :)';
      case AppString.writeSubTitle:
        return '미래를 위한 노력,';
      case AppString.writeInputHint:
        return '공부할 과목을 입력해 주세요.';
      case AppString.writeInputValue:
        return '';
      case AppString.writeStartBtn:
        return '시작';
      case AppString.writePauseBtn:
        return '중지';
      case AppString.writeCancelBtn:
        return '취소';
      case AppString.organizeBoldMainTitle:
        return '총 공부 시간:';
      case AppString.organizeMainTitle:
        return '4시간 20분';
      case AppString.organizeBoldSubTitle:
        return '수학';
      case AppString.organizeSubTitle:
        return '을 제일 많이 공부했어요.';
      case AppString.noticeTitle:
        return '국어 공부를 시작했어요.';
      case AppString.noticeDesc:
        return '당신의 노력을 기록중이에요!';
      // Calendar
      case AppString.calendarTitle:
        return '오늘 일정';
      case AppString.calendarMainText:
        return '코딩하기';
      case AppString.calendarSubText:
        return '외 2개';
      // Todo
      case AppString.todoTitle:
        return '오늘 할 일';
      case AppString.todoLink:
        return '더보기';
      case AppString.todoBoxAddLabel:
        return '할 일 추가하기';
      case AppString.todoTabTitle:
        return 'To-do';
      case AppString.doneTabTitle:
        return 'Done';
      case AppString.todoItemText:
        return '할 일은 여기에 표시돼요!';
      case AppString.doneItemText:
        return '할 일은 여기에 표시돼요!';
      case AppString.memoTitle:
        return '메모';
      case AppString.memoLink:
        return '메모 추가';
      case AppString.memoInputHint:
        return '메모를 입력해 주세요.';
      case AppString.memoInputValue:
        return '메모가 입력되면 이곳에 표시됩니다!';
    }
  }
}
