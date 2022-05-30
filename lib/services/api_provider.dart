import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/models/category.dart';

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
    // var response = await get(_productPath + 'get');
    // var responseList = response.body['data'] as List;
    // return responseList
    //     .map((productJson) => Product.fromJson(productJson))
    //     .toList();
    List<Product> products = [
      Product(
        id: '1',
        name: 'Product 1',
        price: 100,
        imageUrl: 'https://picsum.photos/200/300',
      ),
      Product(
        id: '2',
        name: 'Product 2',
        price: 200,
        imageUrl: 'https://picsum.photos/200/300',
      ),
      Product(
        id: '3',
        name: 'Product 3',
        price: 300,
        imageUrl: 'https://picsum.photos/200/300',
      ),
      Product(
        id: '4',
        name: 'Product 4',
        price: 400,
        imageUrl: 'https://picsum.photos/200/300',
      ),
    ];
    return products;
  }

  Future<List<Category>> getRecommendedCategory() async {
    List<Category> categories = [
      Category(
        id: '1',
        name: 'category 1',
        imageUrl: 'https://picsum.photos/200/300',
      ),
      Category(
        id: '2',
        name: 'category 2',
        imageUrl: 'https://picsum.photos/200/300',
      ),
      Category(
        id: '3',
        name: 'category 3',
        imageUrl: 'https://picsum.photos/200/300',
      ),
      Category(
        id: '4',
        name: 'category 4',
        imageUrl: 'https://picsum.photos/200/300',
      ),
    ];
    return categories;
  }
}
