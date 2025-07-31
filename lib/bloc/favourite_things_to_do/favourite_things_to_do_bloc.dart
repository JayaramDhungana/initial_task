import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/favourite_things_to_do/favourite_things_to_do_event.dart';
import 'package:initial_task/bloc/favourite_things_to_do/favourite_things_to_do_state.dart';

class FavouriteThingsToDoBloc
    extends Bloc<FavouriteThingsToDoEvent, FavouriteThingsToDoState> {
  FavouriteThingsToDoBloc() : super(InitialFavouriteThingsToDoState()) {
    on<AddToFavouriteThingsToDo>(_addToFavouriteThingsToDo);
    on<RemoveFromFavouriteThingsToDo>(_removeFromFavouriteThingsToDo);
  }
  void _addToFavouriteThingsToDo(
    AddToFavouriteThingsToDo event,
    Emitter<FavouriteThingsToDoState> emit,
  ) {
    List<int> currentFavouriteList = List.from(state.favouriteThingsToDoList);
    currentFavouriteList.add(event.index);
    emit(
      AddToFavouriteThingsToDoState(
        favouriteThingsToDoList: currentFavouriteList,
      ),
    );
  }

  void _removeFromFavouriteThingsToDo(
    RemoveFromFavouriteThingsToDo event,
    Emitter<FavouriteThingsToDoState> emit,
  ) {
    List<int> currentFavouriteList = List.from(state.favouriteThingsToDoList);
    currentFavouriteList.remove(event.index);
    emit(
      RemoveFromFavouriteThingsToDoState(
        favouriteThingsToDoList: currentFavouriteList,
      ),
    );
  }
}
