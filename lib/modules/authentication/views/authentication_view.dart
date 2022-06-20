import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:letshop_mobile/modules/authentication/authentication_controller.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateless.dart';


class AuthenticationView extends BaseStateless {
  AuthenticationView({Key? key}) : super(key: key);

  @override
  void init() {}

  final _authController = Get.find<AuthenticationController>();

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return EmptyAppBar();
  }

  @override
  Widget? buildBottomBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildNarrow(BuildContext context) {
    return Column(
      children: [
        Text(
          'example'.tr,
          style: TextStyle(
            color: themeController.error,
          ),
        ),
        TextButton(
          onPressed: () {
            _authController.navigateToSignUp();
          },
          child: Text('SIGN UP'),
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

