class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? views;
  String? status;
  String? createdAt;


  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.views,
    required this.status,
    required this.createdAt,
  });

  // get data and convert it to model
  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    views = json['views'];
    status = json['status'];
    createdAt = json['created_at'];
  }
  
}