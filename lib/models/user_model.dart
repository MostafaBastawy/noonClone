class UserDataModel {
  String? firstName;
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? uid;
  int? cartTotal;

  UserDataModel(
    this.firstName,
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.uid,
    this.cartTotal,
  );

  UserDataModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    uid = json['uid'];
    cartTotal = json['cartTotal'];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'uid': uid,
      'cartTotal': cartTotal,
    };
  }
}
