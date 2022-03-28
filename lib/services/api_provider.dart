import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:letshop_mobile/models/product.dart';

class ApiProvider extends GetConnect {
  static const String host = 'https://letshop-backend.herokuapp.com/api/';
  static const String _token = '';

  @override
  void onInit() {
    httpClient.baseUrl = host;
    httpClient.defaultContentType = 'application/json';

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'Bearer $_token';
      return request;
    });

    super.onInit();
  }

  Future<List<Product>> getRecommendedProduct() async {
    // TODO: Implement
    return [];
  }

  Future<List<Category>> getRecommendedCategory() async {
    // TODO: Implement
    return [];
  }
}
