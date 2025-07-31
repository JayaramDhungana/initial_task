import 'package:equatable/equatable.dart';

abstract class TabbarEvent extends Equatable {}

class ChangeTabIndex extends TabbarEvent {
  final int index;
  ChangeTabIndex({required this.index});

  @override
  List<Object?> get props => [index];
  

}
