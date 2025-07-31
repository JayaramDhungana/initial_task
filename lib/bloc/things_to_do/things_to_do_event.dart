import 'package:equatable/equatable.dart';

abstract class ThingsToDoEvent extends Equatable {}

class LoadThingsToDo extends ThingsToDoEvent {
  @override
  List<Object?> get props => [];
}
