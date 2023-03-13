class FavoriteModel {
  FavoriteModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  int? currentPage;
  List<Datum>? data;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
  }
}

class Datum {
  int? id;
  Product? product;

  Datum.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    product = Product.fromJson(json["product"]);
  }
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
  }
}
