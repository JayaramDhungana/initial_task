import 'package:equatable/equatable.dart';
import 'package:initial_task/data/forum_model.dart';

abstract class ForumState extends Equatable {
  final List<ForumModel> postList;
  const ForumState({required this.postList});
}

class InitialForumState extends ForumState {
  InitialForumState() : super(postList: []);
  @override
  List<Object?> get props => [postList];
}

class AddForumState extends ForumState {
  const AddForumState({required super.postList});

  @override
  List<Object?> get props => [postList];
}

class RemoveForumState extends ForumState {
  const RemoveForumState({required super.postList});
  @override
  List<Object?> get props => [postList];
}

class EditForumState extends ForumState {
 const EditForumState({required super.postList});

    @override
  List<Object?> get props => [postList];

}
