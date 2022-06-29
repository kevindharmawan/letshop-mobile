import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/review.dart';
import 'package:letshop_mobile/modules/product/product_detail_controller.dart';
import 'package:letshop_mobile/shared/cards/review_card.dart';
import '../../utils/routes/app_pages.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

class AllReview extends StatelessWidget{

  // final _reviewController = Get.find<ProductDetailController>();
  get _reviewController => Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offNamed(AppRoutes.productDetail),
        ),
        title: const Text('Review'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Sizing.w(20),
          vertical: Sizing.h(10),
        ),
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Review>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              var reviews = snapshot.data as List<Review>;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReviewCard(review: reviews[index],);
                },
              );
            }
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasError){
              return Text("Error!!!");
            }
            return Text("Loading!!!");
          },
          future: _reviewController.getReview(),
        ),
      ),
    );
  }
}