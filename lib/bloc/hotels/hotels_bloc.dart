import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/hotels/hotels_event.dart';
import 'package:initial_task/bloc/hotels/hotels_state.dart';
import 'package:initial_task/data/hotels_data_list.dart';
import 'package:initial_task/data/hotels_model.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  HotelsBloc() : super(HotelsInitialState()) {
    on<LoadHotelsData>(_loadHotelData);
  }

  void _loadHotelData(LoadHotelsData event, Emitter<HotelsState> emit) {
    List<HotelsModel> initialHotelList = List.from(state.hotelsDataList);
    initialHotelList = hotelsDataList
        .map((element) => HotelsModel.fromJson(element))
        .toList();

    emit(HotelsDataLoadedState(hotelsDataList: initialHotelList));
  }
}
