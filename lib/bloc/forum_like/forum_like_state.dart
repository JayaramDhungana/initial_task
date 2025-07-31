import 'package:equatable/equatable.dart';

class ForumLikeState extends Equatable {
  final List<int> likedPostList;

  ForumLikeState({required this.likedPostList});

  @override
  List<Object?> get props => [likedPostList];
}

class InititalLikeState extends ForumLikeState {
  InititalLikeState() : super(likedPostList: []);

  @override
  List<Object?> get props => [likedPostList];
}

class PostLikeState extends ForumLikeState{
  PostLikeState({required super.likedPostList});



   @override
  List<Object?> get props => [likedPostList];
}

class PostUnlikeState extends ForumLikeState{
  PostUnlikeState({required super.likedPostList});


   @override
  List<Object?> get props => [likedPostList];
}
