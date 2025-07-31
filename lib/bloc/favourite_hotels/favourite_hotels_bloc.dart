import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/favourite_hotels/favourite_hotels_event.dart';
import 'package:initial_task/bloc/favourite_hotels/favourite_hotels_state.dart';

class FavouriteHotelsBloc
    extends Bloc<FavouriteHotelsEvent, FavouriteHotelsState> {
  FavouriteHotelsBloc() : super(InitialFavouriteHotelsState()) {
    on<AddToFavouriteHotelsList>(_addtoFavouriteHotelsList);
    on<RemoveFromFavouriteHotelsList>(_removeFromFavouriteHotelsList);
  }
  void _addtoFavouriteHotelsList(
    AddToFavouriteHotelsList event,
    Emitter<FavouriteHotelsState> emit,
  ) {
    List<int> currentList = List.from(state.favouriteHotelsList);
    currentList.add(event.index);
    emit(AddToFavouriteHotelsListState(favouriteHotelsList: currentList));
  }

  void _removeFromFavouriteHotelsList(
    RemoveFromFavouriteHotelsList event,
    Emitter<FavouriteHotelsState> emit,
  ) {
    List<int> currentLIst = List.from(state.favouriteHotelsList);
    currentLIst.remove(event.index);
    emit(RemoveFromFavouriteHotelsListState(favouriteHotelsList: currentLIst));
  }
}
