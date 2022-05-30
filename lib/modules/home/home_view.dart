import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/modules/home/home_controller.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateless.dart';
import 'package:letshop_mobile/shared/cards/_cards.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/constants/_constants.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';
import 'package:letshop_mobile/utils/routes/_routes.dart';
import 'package:letshop_mobile/modules/settings/account_settings_view.dart';
import 'package:letshop_mobile/shared/appbars/bottom_bar.dart';
import 'package:letshop_mobile/services/api_provider.dart';


import '../../models/category.dart';
import '../../shared/cards/category_card.dart';


class HomeView extends BaseStateless {
  HomeView({Key? key}) : super(key: key);

  final _homeController = Get.find<HomeController>();

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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 28, right: 28),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Recommended for You',
                  style: TextStyle(
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w600,
                    height: Sizing.h(2),
                  ),
                ),
                InkWell(
                  //TODO: Implement see all
                  child: Text(
                    'see all',
                    style: TextStyle(
                      fontSize: FontSize.bodyRegular,
                      color: Colors.blue,
                      height: Sizing.h(2),
                    ),
                  ),
                  onTap: () {
                    Get.offNamed(AppRoutes.recommended);
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: Sizing.h(200),
          child: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                  var recommendedProducts = snapshot.data as List<Product>;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(product: recommendedProducts[index], );
                    },
                  );
                }
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasError){
                  return Text("Error!!!");
                }
                return Text("Loading!!!");
              },
              future: _homeController.getRecommendedProduct(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 28, right: 28),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w600,
                    height: Sizing.h(2),
                  ),
                ),
                InkWell(
                  //TODO: Implement see all
                  child: Text(
                    'see all',
                    style: TextStyle(
                      fontSize: FontSize.bodyRegular,
                      color: Colors.blue,
                      height: Sizing.h(2),
                    ),
                  ),
                  onTap: () {
                    Get.offNamed(AppRoutes.category);
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: Sizing.h(176),
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                var recommendedCategories = snapshot.data as List<Category>;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(category: recommendedCategories[index],);
                  },
                );
              }
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasError){
                return Text("Error!!!");
              }
              return Text("Loading!!!");
            },
            future: _homeController.getRecommendedCategory(),
          ),
        ),
      ],
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




