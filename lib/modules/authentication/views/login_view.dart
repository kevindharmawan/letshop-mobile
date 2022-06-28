import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/modules/authentication/authentication_controller.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateful.dart';
import 'package:letshop_mobile/shared/inputs/_inputs.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/theme/_theme.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseStateful<LoginView> {
  @override
  void init() {}

  final _authController = Get.find<AuthenticationController>();

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar();
  }

  @override
  Widget? buildBottomBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildNarrow(BuildContext context) {
    // TODO: implement buildNarrow
    return Column(
      children: [
        const Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: FontSize.heading3,
          ),
        ),
        InputField(
          controller: _authController.emailController,
          placeholder: 'Enter your email address',
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        InputField(
          controller: _authController.passwordController,
          placeholder: 'Enter your password',
          label: 'Password',
          keyboardType: TextInputType.visiblePassword,
        ),
        TextButton(
          onPressed: () async {
            await _authController.authWithGoogle(isSignUp: false);
          },
          child: const Text('login with google'),
        ),
        TextButton(
          onPressed: () async {
            await _authController.authWithApple(isSignUp: false);
          },
          child: const Text('login with apple'),
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
