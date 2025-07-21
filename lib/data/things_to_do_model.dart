class ThingsToDoModel {
  final String imageUrl;
  final String name;
  final double ratings;
  final int raters;
  final String description;

  ThingsToDoModel({
    required this.imageUrl,
    required this.name,
    required this.ratings,
    required this.raters,
    required this.description,
  });

  factory ThingsToDoModel.fromJson(Map<String, dynamic> json) {
    return ThingsToDoModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      ratings: json['ratings'],
      raters: json['raters'],
      description: json['description'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
       return "imageurl:$imageUrl, name:$name,ratings:$ratings,raters:$raters,description:$description";
    
  }
}
