import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpandableTextProvider extends ChangeNotifier {
  bool isExpanded = false;

  void changeExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}

final expandableTextProvider = ChangeNotifierProvider((ref) {
  return ExpandableTextProvider();
});
