// class HomeModel {
//   bool? status;
//   HomeDataModel? data;

//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? HomeDataModel.fromJson(json['data']) : null;
//   }
// }

// class HomeDataModel {
//   List<BannerModel> banners = [];
//   List<ProductModel> products = [];

//   HomeDataModel.fromJson(Map<String, dynamic> json) {
//     json['banners'].forEach((element) {
//       banners.add(element);
//     });
//     json['products'].forEach((element) {
//       banners.add(element);
//     });
//   }
// }

// class BannerModel {
//   int? id;
//   String? image;
//   BannerModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//   }
// }

// class ProductModel {
//   int? id;
//   num? price;
//   num? oldPrice;
//   num? discount;
//   String? image;
//   String? name;
//   // String? description;
//   // List<String>? innerimages;
//   bool? inFavorites;
//   bool? inCart;

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
// }

// ignore_for_file: unnecessary_question_mark

// class HomeModel {
//   bool? status;
//   Null? message;
//   Data? data;

//   HomeModel({this.status, this.message, this.data});

//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Banners>? banners;
//   List<Products>? products;
//   String? ad;

//   Data({this.banners, this.products, this.ad});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['banners'] != null) {
//       banners = <Banners>[];
//       json['banners'].forEach((v) {
//         banners!.add(Banners.fromJson(v));
//       });
//     }
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(Products.fromJson(v));
//       });
//     }
//     ad = json['ad'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (banners != null) {
//       data['banners'] = banners!.map((v) => v.toJson()).toList();
//     }
//     if (products != null) {
//       data['products'] = products!.map((v) => v.toJson()).toList();
//     }
//     data['ad'] = ad;
//     return data;
//   }
// }

// class Banners {
//   int? id;
//   String? image;
//   Category? category;
//   Null? product;

//   Banners({this.id, this.image, this.category, this.product});

//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     category =
//         json['category'] != null ? Category.fromJson(json['category']) : null;
//     product = json['product'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['image'] = image;
//     if (category != null) {
//       data['category'] = category!.toJson();
//     }
//     data['product'] = product;
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? image;
//   String? name;

//   Category({this.id, this.image, this.name});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['image'] = image;
//     data['name'] = name;
//     return data;
//   }
// }

// class Products {
//   int? id;
//   double? price;
//   double? oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;
//   List<String>? images;
//   bool? inFavorites;
//   bool? inCart;

//   Products(
//       {this.id,
//       this.price,
//       this.oldPrice,
//       this.discount,
//       this.image,
//       this.name,
//       this.description,
//       this.images,
//       this.inFavorites,
//       this.inCart});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['price'] = price;
//     data['old_price'] = oldPrice;
//     data['discount'] = discount;
//     data['image'] = image;
//     data['name'] = name;
//     data['description'] = description;
//     data['images'] = images;
//     data['in_favorites'] = inFavorites;
//     data['in_cart'] = inCart;
//     return data;
//   }
// }
