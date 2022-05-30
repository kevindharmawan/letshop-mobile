import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/category.dart';
import 'package:letshop_mobile/modules/home/home_controller.dart';
import 'package:letshop_mobile/shared/cards/category_card.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

import '../../utils/routes/app_pages.dart';


class AllCategory extends StatelessWidget{

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.offNamed(AppRoutes.home),
        ),
        title: const Text('Category'),
      ),
      body: Container(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {

            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              var allCategory = snapshot.data as List<Category>;
              return GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizing.w(22),
                  vertical: Sizing.h(7),
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 19 / 20,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,

                ),
                itemCount: allCategory.length,
                itemBuilder: (BuildContext context, int index){
                  return CategoryCard(category: allCategory[index],);
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
    );
  }

}