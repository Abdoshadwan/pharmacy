class UserModel {
  late String email;
  String name = '';
  late String phone;
  late String uid;
  late String image;

  UserModel({
    this.email = '',
    required this.name,
    required this.phone,
    required this.uid,
    this.image = '',
  });
  UserModel.fromjson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    uid = json?['uid'];

    image = json?['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'image': image,
    };
  }
}
