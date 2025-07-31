import 'package:equatable/equatable.dart';
import 'package:initial_task/data/restaurants_data_model.dart';

abstract class RestaurantState extends Equatable {
  final List<RestaurantsDataModel> restaurantData;

  const RestaurantState({required this.restaurantData});
}

class RestaurantInitialState extends RestaurantState {
  RestaurantInitialState() : super(restaurantData: []);
  @override
  List<Object?> get props => [restaurantData];
}

class RestaurantDataLoadState extends RestaurantState {
  const RestaurantDataLoadState({required super.restaurantData});

  @override
  List<Object?> get props => [restaurantData];
}
