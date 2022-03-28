import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/product.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateless.dart';
import 'package:letshop_mobile/shared/buttons/button.dart';
import 'package:letshop_mobile/shared/buttons/social_button.dart';
import 'package:letshop_mobile/shared/cards/product_card.dart';
import 'package:letshop_mobile/utils/constants/_constants.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

import 'package:letshop_mobile/shared/appbars/bottom_bar.dart';

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
    return Column(

      children: [
        Text(
          'example'.tr,
        ),
        ProductCard(
            product: Product(
              name: 'Shoes',
            )),
        ProductCard(
            product: Product(
              name: 'Shoes',
            )),
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

