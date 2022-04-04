import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/modules/home/home_controller.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateless.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/constants/_constants.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';
import 'package:letshop_mobile/utils/routes/_routes.dart';

int currentIndex = 0;

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
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themeController.elevated,
      selectedItemColor: themeController.primary,
      unselectedItemColor: themeController.outline,
      selectedFontSize: Sizing.h(10),
      unselectedFontSize: Sizing.h(10),
      onTap: (index) => {
        // setState(() => currentIndex = index)
        Get.offNamed(AppRoutes.auth),
        currentIndex = index
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Wishlist',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: 'History',
          icon: Icon(Icons.history),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    );
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: Sizing.h(200),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [],
            // TODO: Use get recommended from controller, use future builder, and implement loading state
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
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          height: Sizing.h(200),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [],
            // TODO: Use get recommended from controller, use future builder, and implement loading state
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
