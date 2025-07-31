import 'package:dots_indicator/dots_indicator.dart';
import 'package:equatable/equatable.dart';

abstract class DotsIndicatorState extends Equatable {
  final int index;

  const DotsIndicatorState({required this.index});
}

class DotsIndicatorInitialState extends DotsIndicatorState {
  const DotsIndicatorInitialState() : super(index: 0);

  @override
  List<Object?> get props => [index];
}

class ChangeDotsIndicatorState extends DotsIndicatorState {
  const ChangeDotsIndicatorState({required super.index});

  @override
  List<Object?> get props => [index];
}
