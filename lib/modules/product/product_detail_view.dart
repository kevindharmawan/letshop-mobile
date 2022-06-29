import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/appbars/bottom_bar.dart';
import 'package:letshop_mobile/shared/cards/review_card.dart';
import '../../../shared/bases/base_stateless.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/modules/product/product_detail_controller.dart';
import 'package:letshop_mobile/utils/routes/_routes.dart';
import '../../models/review.dart';

class ProductDetailView extends BaseStateless{

  ProductDetailView({Key? key}) : super(key: key);

  get _reviewController => Get.put(ProductDetailController());

  @override
  void init() {}

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return EmptyAppBar();
  }

  @override
  Widget? buildBottomBar(BuildContext context) {
    return BottomBar();
  }

  @override
  Widget buildNarrow(BuildContext context) {
    double averageRate = 0;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Sizing.w(20),
        vertical: Sizing.h(20),
      ),
      height: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0x32000000)),
                bottom: BorderSide(width: 1.0, color: Color(0x32000000))
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: Sizing.w(52),
                  width: Sizing.w(52),
                  margin: EdgeInsets.all(Sizing.w(12)),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(fit: BoxFit.fill, image: new NetworkImage("https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png"))
                  )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Name", style: TextStyle(fontSize: FontSize.bodyLarge)),
                    Row(
                      children: [
                        Text("Verified", style: TextStyle(fontSize: FontSize.bodySmall)),
                        Container(
                            height: Sizing.w(12),
                            width: Sizing.w(12),
                            margin: EdgeInsets.only(left: Sizing.w(4)),
                            child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/6928/6928921.png'))
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: Sizing.h(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Sizing.h(12)),
                  child: Text("Product Description", style: TextStyle(fontSize: FontSize.subheading, fontWeight: FontWeight.bold))
                ),
                Text("Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsa, eius? Debitis perferendis nisi earum dolorem impedit, dolores magni voluptate sunt porro? Veniam unde, quasi totam corporis excepturi sit quas sint? Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsa, eius? Debitis perferendis nisi earum dolorem impedit, dolores magni voluptate sunt porro? Veniam unde, quasi totam corporis excepturi sit quas sint?",
                  style: TextStyle(fontSize: FontSize.bodyLarge))
              ],
            ),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0x32000000))
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: Sizing.h(18), bottom: Sizing.h(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review", style: TextStyle(fontSize: FontSize.subheading, fontWeight: FontWeight.bold)),
                    Row(
                        children: [
                          Container(
                              height: Sizing.w(16),
                              width: Sizing.w(16),
                              margin: EdgeInsets.only(right: Sizing.w(6)),
                              child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/1077px-Star_icon_stylized.svg.png'))
                          ),
                          Text('${averageRate}', style: TextStyle(fontSize: FontSize.bodyLarge))
                        ]
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: Sizing.h(240),
            child: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<List<Review>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  var reviews = snapshot.data as List<Review>;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      averageRate = averageRate + (reviews[index].rate!/reviews.length);
                      print(averageRate);
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
          Container(
            margin: EdgeInsets.only(top: Sizing.h(12)),
            child: OutlinedButton(
              child: Text("See All Review", style: TextStyle(color: Colors.black),),
              onPressed: (){
                Get.offNamed(AppRoutes.allReview);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Sizing.h(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured Product", style: TextStyle(fontSize: FontSize.subheading, fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: null,
                    child: Text("See All", style: TextStyle(color: Colors.blue),)
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildWide(BuildContext context) {
    return buildNarrow(context);
  }

  @override
  Future<bool> onBackPressed() async {
    return true;
  }
}
