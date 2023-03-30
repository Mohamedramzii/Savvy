import 'banner.dart';
import 'product.dart';

class Data {
  List<Banner>? banners;
  List<Product>? products;

  Data({
    this.banners,
    this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
