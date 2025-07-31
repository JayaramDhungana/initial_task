import 'package:equatable/equatable.dart';
import 'package:initial_task/data/things_to_do_model.dart';

abstract class ThingsToDoState extends Equatable {
   final List<ThingsToDoModel> thingsToDoDataList;

  const  ThingsToDoState({required this.thingsToDoDataList});
}

class ThingsToDoInitialState extends ThingsToDoState {
  ThingsToDoInitialState() : super(thingsToDoDataList: []);
  @override
  List<Object?> get props => [thingsToDoDataList];
}

class ThingsToDoLoadedState extends ThingsToDoState {
   const ThingsToDoLoadedState({required super.thingsToDoDataList});
    @override
  List<Object?> get props => [thingsToDoDataList];
}
