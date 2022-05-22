import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/modules/authentication/authentication_controller.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateful.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseStateful<RegisterView> {
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
    // TODO: implement buildNarrow
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(
            Buttons.Google,
            text: "login with Google",
            onPressed: () async {
              await _authController.authWithGoogle(isSignUp: true);
            },
          ),
          SignInButton(
            Buttons.AppleDark,
            text: "login with Apple",
            onPressed: () async {
              await _authController.authWithApple(isSignUp: true);
            },
          ),
        ],
      )
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
