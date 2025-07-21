import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DotsIndicatorProvider extends ChangeNotifier {
  int newIndex = 0;

  void changeIndex(int index) {
    newIndex = index;
    notifyListeners();
  }

  
}

final dotsIndicatorProvider = ChangeNotifierProvider((ref) {
  return DotsIndicatorProvider();
});
