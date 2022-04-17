import 'package:flutter/material.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateless.dart';
import 'package:letshop_mobile/shared/appbars/bottom_bar.dart';
import 'package:letshop_mobile/modules/settings/account_settings_view.dart';

class SettingsView extends BaseStateless{

  const SettingsView({Key? key}) : super(key: key);

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
    return AccountSettingsView();
  }

  @override
  void init() {
    // TODO: implement init
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