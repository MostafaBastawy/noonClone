class CategoryDataModel {
  String? categoryName;
  String? categoryImage;

  CategoryDataModel(
    this.categoryName,
    this.categoryImage,
  );

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['name'];
    categoryImage = json['imageUrl'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': categoryName,
      'imageUrl': categoryImage,
    };
  }
}
