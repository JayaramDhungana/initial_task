import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task/bloc/forum/forum_bloc.dart';
import 'package:initial_task/bloc/forum/forum_state.dart';
import 'package:initial_task/custom_painter/custom_design_forum.dart';
import 'package:initial_task/custom_painter/custom_painter_design1.dart';
import 'package:initial_task/custom_painter/shape_maker_design.dart';
import 'package:initial_task/widgets/forum_post_dialog.dart';
import 'package:initial_task/widgets/forum_widget.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  TextEditingController postController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: ShapeMakerDesign()
          ),
          Expanded(           
             child: BlocBuilder<ForumBloc, ForumState>(
              builder: (context, state) {
                if (state is InitialForumState) {
                  return Center(
                    child: Text(
                      "No Post",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.postList.length,
                    itemBuilder: (context, index) {
                      final postToShow = state.postList[index];
                      return ForumWidget(
                        post: postToShow.post,
                        id: postToShow.id,
                        index: index,
                        );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return forumPostDialog(
                  postController: postController,
                  context: context,
                  focusNode: focusNode,
                  formkey: _formKey,
                  
                );
              },
            );
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
