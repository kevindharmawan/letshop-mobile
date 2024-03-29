import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/shared/bases/base_page.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/_theme.dart';

abstract class BaseStateful<T extends StatefulWidget> extends State<T>
    implements BasePage {
  @override
  void initState() {
    super.initState();
    init();
  }

  ThemeController get themeController => GetInstance().find<ThemeController>();

  Widget buildBody(BuildContext context) {
    if (Sizing.isWide()) {
      return buildWide(context);
    }
    return buildNarrow(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context),
        bottomNavigationBar: buildBottomBar(context),
      ),
      onWillPop: onBackPressed,
    );
  }
}
