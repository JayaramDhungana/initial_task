import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/things_to_do/things_to_do_event.dart';
import 'package:initial_task/bloc/things_to_do/things_to_do_state.dart';
import 'package:initial_task/data/things_to_do_data_list.dart';
import 'package:initial_task/data/things_to_do_model.dart';

class ThingsToDoBloc extends Bloc<ThingsToDoEvent, ThingsToDoState> {
  ThingsToDoBloc() : super(ThingsToDoInitialState()) {
    on<LoadThingsToDo>(_loadThingsToDoData);
  }
  void _loadThingsToDoData(
    LoadThingsToDo event,
    Emitter<ThingsToDoState> emit,
  ) {
    List<ThingsToDoModel> initialThingsToDoData = List.from(
      state.thingsToDoDataList,
    );
    initialThingsToDoData = thingsToDoDataList
        .map((element) => ThingsToDoModel.fromJson(element))
        .toList();

    emit(ThingsToDoLoadedState(thingsToDoDataList: initialThingsToDoData));
  }
}
