import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/memo_editor.dart';

class MemoEditorNotifier extends StateNotifier<MemoEditor> {
  MemoEditorNotifier()
      : super(
          MemoEditor(
            blur: 0,
            top: 520,
            ignoring: true,
            focus: FocusNode(),
          ),
        );

  void show() {
    state = MemoEditor(
      blur: 30,
      top: 150,
      ignoring: false,
      focus: state.focus,
    );
  }

  void hide() {
    state = MemoEditor(
      blur: 0,
      top: 520,
      ignoring: true,
      focus: state.focus,
    );
  }
}

final memoEditorStateNotiferProvider =
    StateNotifierProvider<MemoEditorNotifier, MemoEditor>((ref) {
  return MemoEditorNotifier();
});
