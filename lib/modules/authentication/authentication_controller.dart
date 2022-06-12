import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/models/user.dart';
import 'package:letshop_mobile/modules/authentication/_authentication.dart';
import 'package:letshop_mobile/modules/home/_home.dart';
import 'package:letshop_mobile/services/authentication.dart';
import 'package:letshop_mobile/utils/constants/_constants.dart';
import 'package:letshop_mobile/utils/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  late Authentication _authService;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  @override
  void onInit() {
    super.onInit();
    _authService = Authentication();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }

  void navigateToSignIn() {
    // loginFormKey = GlobalKey<FormState>();
    emailController.clear();
    passwordController.clear();
    Get.toNamed(AppRoutes.auth + AppRoutes.login);
  }

  void navigateToSignUp() {
    // registerFormKey = GlobalKey<FormState>();
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    Get.toNamed(AppRoutes.auth + AppRoutes.register);
  }

  Future<void> authWithGoogle({required bool isSignUp}) async {
    var _isAccountExist = await _authService.getGoogleAccount();
    if (_isAccountExist) {
      var _result = await _authService.authWithGoogle(isSignUp);
      print(_result);
    }
  }

  Future<void> authWithApple({required bool isSignUp}) async {
    var _isAccountExist = await _authService.getAppleAccount();
    if (_isAccountExist) {
      var _result = await _authService.authWithApple(isSignUp);
      print(_result);
    }
  }

  Future signOut() async {
    var _signOut = await _authService.signOut();
    return _signOut;
  }
}
