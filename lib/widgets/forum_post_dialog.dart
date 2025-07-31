import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/forum/forum_bloc.dart';
import 'package:initial_task/bloc/forum/forum_events.dart';

SimpleDialog forumPostDialog({
  required TextEditingController postController,
  required BuildContext context,
  required FocusNode focusNode,
  required GlobalKey<FormState> formkey,
  int? id,
  int? index,
}) {
  return SimpleDialog(
    title: Center(child: id != null ? Text("Edit Post") : Text("Add a Post")),

    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Value Can not be null';
              } else {
                return null;
              }
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            focusNode: focusNode,
            controller: postController,
            style: TextStyle(color: Colors.black),
            maxLines: 5,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ),
      Row(
        children: [
          Spacer(),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: TextStyle(color: Colors.black)),
          ),

          SimpleDialogOption(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                id == null
                    ? context.read<ForumBloc>().add(
                        AddForum(
                          id: DateTime.now().millisecondsSinceEpoch,
                          post: postController.text,
                        ),
                      )
                    : context.read<ForumBloc>().add(
                        EditForum(index: index!, id: id, post: postController.text),
                      );
                Navigator.pop(context);
                postController.clear();
              }
            },

            child: Text("Post", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    ],
  );
}
