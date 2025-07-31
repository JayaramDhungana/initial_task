import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/forum/forum_bloc.dart';
import 'package:initial_task/bloc/forum/forum_events.dart';
import 'package:initial_task/bloc/forum_like/forum_like_bloc.dart';
import 'package:initial_task/bloc/forum_like/forum_like_event.dart';
import 'package:initial_task/widgets/forum_post_dialog.dart';
import 'package:intl/intl.dart';

class ForumWidget extends StatefulWidget {
  final String post;
  final int id;
  final int index;
  const ForumWidget({
    super.key,
    required this.post,
    required this.id,
    required this.index,
  });

  @override
  State<ForumWidget> createState() => _ForumWidgetState();
}

class _ForumWidgetState extends State<ForumWidget> {
  FocusNode foucsNode = FocusNode();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController postController = TextEditingController(
      text: widget.post,
    );
    final likedPost = context.watch<ForumLikeBloc>().state.likedPostList;
    bool isLiked = likedPost.contains(widget.id);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        color: Colors.white60,
        child: Container(
          decoration: BoxDecoration(color: Colors.white10),
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.39,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.man),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jayaram Dhungana",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          DateFormat('MMMM d').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == "Delete") {
                          context.read<ForumBloc>().add(
                            RemoveForum(id: widget.id),
                          );
                        } else if (value == "Edit") {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return forumPostDialog(
                                postController: postController,
                                context: context,
                                focusNode: foucsNode,
                                formkey: formkey,
                                id: widget.id,
                                index: widget.index,
                              );
                            },
                          );
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "Delete",
                          child: Row(
                            children: [Icon(Icons.delete), Text("Delete")],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Edit",
                          child: Row(
                            children: [Icon(Icons.edit), Text("Edit")],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10), //Row Close of above image,name and others
                Text(
                  maxLines: 10,
                  widget.post,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 7),
                Divider(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        isLiked
                            ? context.read<ForumLikeBloc>().add(
                                RemoveFromLike(postId: widget.id),
                              )
                            : context.read<ForumLikeBloc>().add(
                                AddToLike(postId: widget.id),
                              );
                      },
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_outline,
                        color: isLiked ? Colors.red : Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text("Comments", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
