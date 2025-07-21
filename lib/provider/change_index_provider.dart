import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeIndexProvider extends ChangeNotifier {
  int index = 0;

  void changeIndex(int newIndex) {
    if (newIndex != index) {
      index = newIndex;
      notifyListeners();
    }
  }
}

final changeIndexProvider = ChangeNotifierProvider((ref) {
  return ChangeIndexProvider();
});
