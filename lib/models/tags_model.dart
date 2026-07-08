class TagsModel {
  // define variables
  String? id;
  String? title;

  TagsModel({
    // constructor with required parameters
    required this.id,
    required this.title,
  });

  TagsModel.fromJson(Map<String, dynamic> json) {
    // convert json data to model
    id = json['id'];
    title = json['title'];
  }
}
