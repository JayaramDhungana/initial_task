import 'package:equatable/equatable.dart';

abstract class FavouriteThingsToDoState extends Equatable {
 final List<int> favouriteThingsToDoList;

 const  FavouriteThingsToDoState({required this.favouriteThingsToDoList});

  @override

  List<Object?> get props => [favouriteThingsToDoList];
}

class InitialFavouriteThingsToDoState extends FavouriteThingsToDoState{
  InitialFavouriteThingsToDoState():super(favouriteThingsToDoList: []);

}

class AddToFavouriteThingsToDoState extends FavouriteThingsToDoState{
 const  AddToFavouriteThingsToDoState({required super.favouriteThingsToDoList});

    @override

  List<Object?> get props => [favouriteThingsToDoList];
}

class RemoveFromFavouriteThingsToDoState extends FavouriteThingsToDoState{
  const RemoveFromFavouriteThingsToDoState({required super.favouriteThingsToDoList});

}