import 'package:get/get.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/models/review.dart';
import 'package:letshop_mobile/models/user.dart';
import 'package:letshop_mobile/services/api_provider.dart';

class ProductDetailController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  Future<Product> getProduct() async {
    return _provider.getProduct();
  }

  Future<List<Review>> getReview() async {
    return _provider.getReview();
  }

}
