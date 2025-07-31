import 'package:equatable/equatable.dart';

abstract class ForumLikeEvent extends Equatable {}

class AddToLike extends ForumLikeEvent {
  final int postId;
  AddToLike({required this.postId});

  @override
  List<Object?> get props => [postId];
}

class RemoveFromLike extends ForumLikeEvent {
  final int postId;
   RemoveFromLike({required this.postId});

   @override
  List<Object?> get props => [postId];
}
