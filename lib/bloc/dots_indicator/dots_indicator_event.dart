import 'package:equatable/equatable.dart';

abstract class DotsIndicatorEvent extends Equatable {}

class ChangeIndex extends DotsIndicatorEvent {
  final int index;
  ChangeIndex({required this.index});

  @override
  List<Object?> get props => [index];
}
