import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/data/restaurants_data_list.dart';
import 'package:initial_task/data/restaurants_data_model.dart';

class RestaurantProvider extends ChangeNotifier {
  List<RestaurantsDataModel> restaurantsData = [];

  void loadRestaurantsData() {
    restaurantsData = restaurantsDataList
        .map((element) => RestaurantsDataModel.formJson(element))
        .toList();
    notifyListeners();
  }
}

final restaurantProvider = ChangeNotifierProvider((ref) {
  return RestaurantProvider();
});
