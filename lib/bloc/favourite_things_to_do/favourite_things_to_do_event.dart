import 'package:equatable/equatable.dart';

class FavouriteThingsToDoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToFavouriteThingsToDo extends FavouriteThingsToDoEvent {
  int index;
  AddToFavouriteThingsToDo({required this.index});

  @override
  List<Object?> get props => [index];
}

class RemoveFromFavouriteThingsToDo extends FavouriteThingsToDoEvent {
  int index;
  RemoveFromFavouriteThingsToDo({required this.index});

   @override
  List<Object?> get props => [index];
}
