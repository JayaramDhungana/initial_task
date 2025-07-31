import 'package:equatable/equatable.dart';

abstract class TabbarState extends Equatable {
  final int index;
  const TabbarState({required this.index});
}

class TabbarInitialState extends TabbarState {
  const TabbarInitialState() : super(index: 0);
  @override
  List<Object?> get props => [index];
}

class ChangedIndex extends TabbarState {
  const ChangedIndex({required super.index});
  @override
  List<Object?> get props => [index];
}
