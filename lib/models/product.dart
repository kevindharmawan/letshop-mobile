import 'package:letshop_mobile/models/store.dart';
import 'package:letshop_mobile/models/review.dart';

class Product {
  String? id;
  Store? store;
  String? name;
  String? description;
  String? imageUrl;
  int? price;
  int? stock;
  int? discount;
  int? rate;
  List<Review>? listReview;
  int? sold;

  Product(
      {this.id,
      this.store,
      this.name,
      this.description,
      this.imageUrl,
      this.price,
      this.stock,
      this.discount});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      discount: json['discount'],
    );
  }
}
