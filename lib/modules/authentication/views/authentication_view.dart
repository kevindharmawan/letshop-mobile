import 'package:flutter/material.dart';

import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateless.dart';
import 'package:letshop_mobile/shared/appbars/bottom_bar.dart';

import 'package:letshop_mobile/modules/settings/account_settings_view.dart';
import 'package:letshop_mobile/modules/settings/user_settings_view.dart';

class AuthenticationView extends BaseStateless {
  const AuthenticationView({Key? key}) : super(key: key);

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
    // return Column(
    //   children: [
    //     Text(
    //       'example'.tr,
    //     ),
    //     ProductCard(
    //         product: Product(
    //           name: 'Shoes',
    //         )),
    //     ProductCard(
    //         product: Product(
    //           name: 'Shoes',
    //         )),
    //   ],
    // );

    // return AccountSettingsView();

    return UserSettingsView();

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

