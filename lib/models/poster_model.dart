class PosterModel {
  // create a model for poster with id, title and image
  String? id;
  String? title;
  String? image;

  PosterModel({
    // constructor with required parameters
    required this.id,
    required this.title,
    required this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> json) {
    // convert json data to model
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
}