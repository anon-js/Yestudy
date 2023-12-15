import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/memo_change.dart';

class MemoChangeNotifier extends StateNotifier<MemoChange> {
  MemoChangeNotifier() : super(MemoChange(isChange: false, height: 150));

  void change() {
    state = MemoChange(
      isChange: !state.isChange,
      height: state.height == 370 ? 150 : 370,
    );
  }
}

final memoChangeStateNotiferProvider =
    StateNotifierProvider<MemoChangeNotifier, MemoChange>((ref) {
  return MemoChangeNotifier();
});
