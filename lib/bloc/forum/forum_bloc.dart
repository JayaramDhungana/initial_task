import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/forum/forum_events.dart';
import 'package:initial_task/bloc/forum/forum_state.dart';
import 'package:initial_task/data/forum_model.dart';

class ForumBloc extends Bloc<ForumEvents, ForumState> {
  ForumBloc() : super(InitialForumState()) {
    on<AddForum>(_addForum);
    on<RemoveForum>(_removeForum);
    on<EditForum>(_editForum);
  }
  void _addForum(AddForum event, Emitter<ForumState> emit) {
    final List<ForumModel> currentList = List.from(state.postList);

    currentList.add(ForumModel(id: event.id, post: event.post));
    emit(AddForumState(postList: currentList));
  }

  void _removeForum(RemoveForum event, Emitter<ForumState> emit) {
    final List<ForumModel> currentList = List.from(state.postList);
    currentList.removeWhere((item) => item.id == event.id);
    emit(RemoveForumState(postList: currentList));
  }

  void _editForum(EditForum event, Emitter<ForumState> emit) {
    final List<ForumModel> currentList = List.from(state.postList);
    currentList[event.index] = ForumModel(id: event.id, post: event.post);
    emit(EditForumState(postList: currentList));
  }
}
