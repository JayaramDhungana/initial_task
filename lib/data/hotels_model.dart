class HotelsModel {
  final String imageUrl;
  final String hotelName;
  final double ratings;
  final int raters;
  final String description;

  HotelsModel({
    required this.imageUrl,
    required this.hotelName,
    required this.ratings,
    required this.raters,
    required this.description,
  });

  factory HotelsModel.fromJson(Map<String, dynamic> json) {
    return HotelsModel(
      imageUrl: json['imageUrl'],
      hotelName: json['hotelName'],
      ratings: json['ratings'],
      raters: json['raters'],
      description: json['description'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "imageurl:$imageUrl,hotelname:$hotelName,ratings:$ratings,raters:$raters,description:$description";
  }
}
