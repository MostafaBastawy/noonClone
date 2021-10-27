class ProductDataModel {
  String? categoryName;
  String? description;
  String? imageUrl;
  String? name;
  int? price;
  String? pUid;

  ProductDataModel(
    this.categoryName,
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.pUid,
  );

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    price = json['price'];
    pUid = json['pUid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'category': categoryName,
      'description': description,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'pUid': pUid,
    };
  }
}
