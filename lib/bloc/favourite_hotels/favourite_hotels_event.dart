import 'package:equatable/equatable.dart';

abstract class FavouriteHotelsEvent extends Equatable {}

class AddToFavouriteHotelsList extends FavouriteHotelsEvent {
  final int index;
  AddToFavouriteHotelsList({required this.index});

  @override
  List<Object?> get props => [index];
}

class RemoveFromFavouriteHotelsList extends FavouriteHotelsEvent {
  final int index;
  RemoveFromFavouriteHotelsList({required this.index});

  @override
  List<Object?> get props => [index];
}
