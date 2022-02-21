import 'package:letshop_mobile/models/store.dart';

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
