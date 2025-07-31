import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/dots_indicator/dots_indicator_event.dart';
import 'package:initial_task/bloc/dots_indicator/dots_indicator_state.dart';

class DotsIndicatorBloc extends Bloc<DotsIndicatorEvent, DotsIndicatorState> {
  DotsIndicatorBloc() : super(DotsIndicatorInitialState()) {
    on<ChangeIndex>(_changeIndex);
  }

  void _changeIndex(ChangeIndex event, Emitter<DotsIndicatorState> emit) {
    emit(ChangeDotsIndicatorState(index: event.index));
  }
}
