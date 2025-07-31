class ForumModel {
  final int id;
  final String post;

  ForumModel({required this.id, required this.post});

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(id: json['id'], post: json['post']);
  }
}
