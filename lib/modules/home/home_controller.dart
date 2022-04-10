import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/services/api_provider.dart';

class HomeController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  Future<List<Product>> getRecommendedProduct() async {
    return _provider.getRecommendedProduct();
  }

  Future<List<Category>> getRecommendedCategory() async {
    return _provider.getRecommendedCategory();
  }
}
