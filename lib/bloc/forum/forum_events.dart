import 'package:equatable/equatable.dart';

abstract class ForumEvents extends Equatable {}

class AddForum extends ForumEvents {
  final int id;
  final String post;

  AddForum({required this.id, required this.post});

  @override
  List<Object?> get props => [id, post];
}

class RemoveForum extends ForumEvents {
  final int id;
  RemoveForum({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class EditForum extends ForumEvents {
  final int index;
  final int id;
  final String post;
  EditForum({required this.index,required this.id,required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
