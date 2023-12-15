import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yestudy/models/bottom_nav.dart';

class BottomNavNotifier extends StateNotifier<BottomNav> {
  BottomNavNotifier() : super(BottomNav(selectedIndex: 0));

  void select(int index) {
    state = BottomNav(selectedIndex: index);
  }
}

final bottomNavStateNotiferProvider =
StateNotifierProvider<BottomNavNotifier, BottomNav>((ref) {
  return BottomNavNotifier();
});
