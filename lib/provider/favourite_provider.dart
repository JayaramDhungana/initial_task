import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteProvider extends ChangeNotifier {
   List favouriteIndexListOfHotel = [];
   List favouriteIndexListOfThingsToDo = [];

  //For Hotel
  void addToFavouriteHotels(int index) {
    if (!favouriteIndexListOfHotel.contains(index)) {
      favouriteIndexListOfHotel.add(index);
      debugPrint(index.toString());
      notifyListeners();
    } else {
      favouriteIndexListOfHotel.remove(index);
      notifyListeners();
    }
  }
  //For ThingsToDo
    void addToFavouriteThingsToDo(int index) {
    if (!favouriteIndexListOfThingsToDo.contains(index)) {
      favouriteIndexListOfThingsToDo.add(index);
      debugPrint(index.toString());
      notifyListeners();
    } else {
      favouriteIndexListOfThingsToDo.remove(index);
      notifyListeners();
    }
  }


}

final favouriteProvider = ChangeNotifierProvider((ref) {
  return FavouriteProvider();
});
