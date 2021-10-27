class CartDataModel {
  String? description;
  String? imageUrl;
  String? name;
  int? price;
  String? userUid;
  String? pUid;
  int? counter;
  CartDataModel(
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.userUid,
    this.pUid,
    this.counter,
  );

  CartDataModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    price = json['price'];
    userUid = json['userUid'];
    pUid = json['pUid'];
    counter = json['counter'];
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'userUid': userUid,
      'pUid': pUid,
      'counter': counter,
    };
  }
}
