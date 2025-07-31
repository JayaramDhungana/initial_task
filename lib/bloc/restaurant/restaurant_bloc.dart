import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/restaurant/restaurant_event.dart';
import 'package:initial_task/bloc/restaurant/restaurant_state.dart';
import 'package:initial_task/data/restaurants_data_list.dart';
import 'package:initial_task/data/restaurants_data_model.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitialState()) {
    on<LoadRestaurantData>(_loadRestaurantData);
  }

  void _loadRestaurantData(
    LoadRestaurantData event,
    Emitter<RestaurantState> emit,
  ) {
    List<RestaurantsDataModel> currentRestaurantList = List.from(
      state.restaurantData,
    );
    currentRestaurantList = restaurantsDataList
        .map((element) => RestaurantsDataModel.formJson(element))
        .toList();
    emit(RestaurantDataLoadState(restaurantData: currentRestaurantList));
  }
}
