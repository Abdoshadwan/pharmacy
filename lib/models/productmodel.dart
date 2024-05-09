class ProductsModel {
  dynamic price;
  late String image;
  late String name;
  late bool infavorite;

  ProductsModel(
      {this.name = '',
      this.price = '',
      this.infavorite = false,
      this.image = ''});
  ProductsModel.fromjson(Map<String, dynamic> json) {
    price = json['price'];
    image = json['image'];
    name = json['name'];
    infavorite = json['in_favorites'];
  }
  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'image': image,
      'name': name,
      'in_favorites': infavorite,
    };
  }
}
