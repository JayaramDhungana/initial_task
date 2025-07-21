class RestaurantsDataModel {
  final String imageUrl;
  final String name;
  final String description;
  final double ratings;
  final int raters;

  RestaurantsDataModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.ratings,
    required this.raters,
  });

  factory RestaurantsDataModel.formJson(Map<String, dynamic> json) {
    return RestaurantsDataModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      ratings: json['ratings'],
      raters: json['raters'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "imageUrl:$imageUrl,name:$name,description:$description,ratings:$ratings,raters:$raters";
  }
}
