class FavoriteDataModel {
  String? description;
  String? imageUrl;
  String? name;
  String? price;
  String? userUid;
  String? pUid;
  FavoriteDataModel(
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.userUid,
    this.pUid,
  );

  FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    price = json['price'];
    userUid = json['userUid'];
    pUid = json['pUid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'userUid': userUid,
      'pUid': pUid,
    };
  }
}
