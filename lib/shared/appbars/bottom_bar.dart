import 'package:flutter/material.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';
import 'package:letshop_mobile/utils/routes/_routes.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBar createState() => _BottomBar();
}

int _currentIndex = 0;

class _BottomBar extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themeController.elevated,
      selectedItemColor: themeController.primary,
      unselectedItemColor: themeController.outline,
      selectedFontSize: Sizing.h(10),
      unselectedFontSize: Sizing.h(10),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          if(_currentIndex == 0) Get.offNamed(AppRoutes.home);
          else if(_currentIndex == 3) Get.offNamed(AppRoutes.accountSettings);
        });
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
}
