class ProductDataModel {
  String? categoryName;
  String? description;
  String? imageUrl;
  String? name;
  String? price;
  String? uid;

  ProductDataModel(
    this.categoryName,
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.uid,
  );

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    price = json['price'];
    uid = json['uid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'category': categoryName,
      'description': description,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'uid': uid,
    };
  }
}
