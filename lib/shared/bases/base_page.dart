import 'package:flutter/material.dart';

abstract class BasePage {
  void init();

  PreferredSizeWidget buildAppBar(BuildContext context);

  Widget buildNarrow(BuildContext context);

  Widget buildWide(BuildContext context);

  Widget? buildBottomBar(BuildContext context);

  @protected
  Future<bool> onBackPressed();
}
