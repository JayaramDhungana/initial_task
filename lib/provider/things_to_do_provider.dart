
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/data/things_to_do_data_list.dart';
import 'package:initial_task/data/things_to_do_model.dart';

class ThingsToDoProvider extends ChangeNotifier {
  List<ThingsToDoModel> thingsToDoList = [];

  loadThingsToDoList() {
    thingsToDoList =
        thingsToDoDataList
            .map((element) => ThingsToDoModel.fromJson(element))
            .toList();
    notifyListeners();
  }
}

final thingsTODoProvider = ChangeNotifierProvider((ref) {
  return ThingsToDoProvider();
});
