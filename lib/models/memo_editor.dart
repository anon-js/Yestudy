import 'package:flutter/material.dart';

class MemoEditor {
  double blur;
  double top;
  bool ignoring;
  FocusNode focus;

  MemoEditor({
    required this.blur,
    required this.top,
    required this.ignoring,
    required this.focus,
  });
}
