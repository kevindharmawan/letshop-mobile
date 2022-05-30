import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/modules/home/home_controller.dart';
import 'package:letshop_mobile/shared/cards/_cards.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

import '../../utils/routes/app_pages.dart';

class AllRecommended extends StatelessWidget{

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offNamed(AppRoutes.home),
        ),
        title: const Text('Recommended'),
      ),
      body: Container(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {

            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              var recommendedProducts = snapshot.data as List<Product>;
              return GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizing.w(7),
                    vertical: Sizing.h(7),
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 19 / 20,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,

                  ),
                  itemCount: recommendedProducts.length,
                  itemBuilder: (BuildContext context, int index){
                    return ProductCard(product: recommendedProducts[index],);
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
    );

    throw UnimplementedError();
  }

}