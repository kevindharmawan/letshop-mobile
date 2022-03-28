import 'package:letshop_mobile/models/store.dart';
import 'package:letshop_mobile/models/review.dart';

class Product {
  String? id;
  Store? store;
  // TODO: category
  String? name;
  String? description;
  String? imageUrl;
  int? price;
  int? stock;
  int? discount;
  int? rate;
  List<review>? listReview;
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
}
