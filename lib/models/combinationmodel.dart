class CombinModel {
  String name = '';
  late String image;
  late String price;
  late String text;

  CombinModel({
    required this.name,
    this.text = '',
    this.image = '',
    this.price=''
  });
  CombinModel.fromjson(Map<String, dynamic>? json) {
    name = json?['name'];
    price=json?['price'];
    image = json?['image'];

    text = json?['text'];

  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'text': text,
      'price':price
    };
  }
}
