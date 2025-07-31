import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/forum_like/forum_like_event.dart';
import 'package:initial_task/bloc/forum_like/forum_like_state.dart';

class ForumLikeBloc extends Bloc<ForumLikeEvent, ForumLikeState> {
  ForumLikeBloc() : super(InititalLikeState()) {
    on<AddToLike>(_addToLike);
    on<RemoveFromLike>(_removeFromLike);
  }

  void _addToLike(AddToLike event, Emitter<ForumLikeState> emit) {
    List<int> currentLikeState = List.from(state.likedPostList);
    currentLikeState.add(event.postId);
    emit(PostLikeState(likedPostList: currentLikeState));
  }

    void _removeFromLike(RemoveFromLike event, Emitter<ForumLikeState> emit) {
    List<int> currentLikeState = List.from(state.likedPostList);
    currentLikeState.remove(event.postId);
    emit(PostLikeState(likedPostList: currentLikeState));
  }
}
