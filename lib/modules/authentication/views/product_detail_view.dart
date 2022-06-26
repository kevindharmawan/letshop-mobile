import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/appbars/bottom_bar.dart';
import '../../../shared/bases/base_stateless.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/modules/authentication/views/product_review.dart';

class ProductDetailView extends BaseStateless{

  const ProductDetailView({Key? key}) : super(key: key);

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
          ProductReview(),
          Container(
            child: OutlinedButton(
              child: Text("See All Review", style: TextStyle(color: Colors.black),),
              onPressed: null,
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
