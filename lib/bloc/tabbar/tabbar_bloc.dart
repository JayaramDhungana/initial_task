import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/tabbar/tabbar_event.dart';
import 'package:initial_task/bloc/tabbar/tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(TabbarInitialState()) {
    on<ChangeTabIndex>(_changeIndex);
  }

  void _changeIndex(ChangeTabIndex event, Emitter<TabbarState> emit) {
    emit(ChangedIndex(index: event.index));
  }
}
