import 'package:letshop_mobile/models/store.dart';
import 'package:letshop_mobile/models/review.dart';

class Category {
  String? id;
  String? name;
  String? description;
  String? imageUrl;


  Category(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
    );
  }
}


