import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letshop_mobile/modules/authentication/authentication_controller.dart';
import 'package:letshop_mobile/shared/appbars/empty_app_bar.dart';
import 'package:letshop_mobile/shared/bases/base_stateful.dart';

import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

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
          Text(
            'Welcome !',
            style: TextStyle(fontSize: FontSize.heading3),
            textAlign: TextAlign.left,
          ),
          Container(
            margin: EdgeInsets.all(4),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(Sizing.w(300), Sizing.h(32))
              ),
              icon: Image.network('https://tantech.ie/stoagnuk/2022/03/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png', width: 28, height: 28),
              label: Text('Login with Google'),
              onPressed: () async {
                await _authController.authWithGoogle(isSignUp: true);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(4),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(Sizing.w(300), Sizing.h(32))
              ),
              icon: Icon(Icons.apple, size: 28, color: Colors.black),
              label: Text('Login with Apple'),
              onPressed: () async {
                await _authController.authWithApple(isSignUp: true);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  fixedSize: Size(Sizing.w(300), Sizing.h(28))
              ),
              child: Text('Login'),
              onPressed: (){},
            ),
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
