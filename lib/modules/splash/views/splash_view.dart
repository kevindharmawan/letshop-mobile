import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizing(context);
    return Center(
      child: Text(
        'app_name'.tr,
      ),
    );
  }
}
