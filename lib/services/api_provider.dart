import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:letshop_mobile/models/product.dart';

class ApiProvider extends GetConnect {
  late String _token = '';

  static const String _host = 'https://letshop-backend.herokuapp.com/api/';
  static const String _productPath = 'product/';

  @override
  void onInit() async {
    _token = await FirebaseAuth.instance.currentUser!.getIdToken(true);

    httpClient.baseUrl = _host;
    httpClient.defaultContentType = 'application/json';

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'Bearer $_token';
      return request;
    });

    super.onInit();
  }

  Future<List<Product>> getRecommendedProduct() async {
    var response = await get(_productPath + 'get');
    var responseList = response.body['data'] as List;
    return responseList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
  }

  Future<List<Category>> getRecommendedCategory() async {
    // TODO: Implement
    return [];
  }
}
