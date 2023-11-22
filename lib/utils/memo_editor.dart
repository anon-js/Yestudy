import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoEditor {
  double blur;
  double topPosition;
  double memoHeight;

  MemoEditor({required this.blur, required this.topPosition, required this.memoHeight});
}

class MemoEditorNotifier extends StateNotifier<MemoEditor> {
  MemoEditorNotifier() : super(MemoEditor(blur: 0.0, topPosition: 450, memoHeight: 100));

  void show(double topPosition) {
    state = MemoEditor(blur: 12.0, topPosition: topPosition, memoHeight: 270);
  }
  void hide() {
    state = MemoEditor(blur: 0.0, topPosition: 450, memoHeight: 100);
  }
}

final memoEditorStateNotiferProvider = StateNotifierProvider<MemoEditorNotifier, MemoEditor>((ref) {
  return MemoEditorNotifier();
});
