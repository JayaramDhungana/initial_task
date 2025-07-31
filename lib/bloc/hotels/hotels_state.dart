import 'package:equatable/equatable.dart';
import 'package:initial_task/data/hotels_model.dart';

abstract class HotelsState extends Equatable {
  final List<HotelsModel> hotelsDataList;
  const HotelsState({required this.hotelsDataList});
}

class HotelsInitialState extends HotelsState {
  HotelsInitialState() : super(hotelsDataList: []);
  @override
  List<Object?> get props => [hotelsDataList];
}

class HotelsDataLoadedState extends HotelsState {
 const  HotelsDataLoadedState({required super.hotelsDataList});
  @override
  List<Object?> get props => [hotelsDataList];
}
