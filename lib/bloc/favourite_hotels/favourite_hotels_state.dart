import 'package:equatable/equatable.dart';

abstract class FavouriteHotelsState extends Equatable {
  final List<int> favouriteHotelsList;

  const FavouriteHotelsState({required this.favouriteHotelsList});
}

class InitialFavouriteHotelsState extends FavouriteHotelsState {
  InitialFavouriteHotelsState() : super(favouriteHotelsList: []);

  @override
  List<Object?> get props => [favouriteHotelsList];
}

class AddToFavouriteHotelsListState extends FavouriteHotelsState {
  const AddToFavouriteHotelsListState({required super.favouriteHotelsList});

  @override
  List<Object?> get props => [favouriteHotelsList];
}

class RemoveFromFavouriteHotelsListState extends FavouriteHotelsState {
  const RemoveFromFavouriteHotelsListState({required super.favouriteHotelsList});

  @override
  List<Object?> get props => [favouriteHotelsList];
}
