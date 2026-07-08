class PodcastModle {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? views;
  String? createdAt;

  PodcastModle({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.views,
    required this.createdAt,
  });


  // get data and convert it to model
  PodcastModle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
    publisher = json['publisher'];
    views = json['views'];
    createdAt = json['created_at'];
  }
}