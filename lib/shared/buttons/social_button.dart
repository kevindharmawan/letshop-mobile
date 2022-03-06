import 'package:flutter/material.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';



class SocialButton extends StatelessWidget {
  final Function onPress;

  const SocialButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: Sizing.h(8),
          horizontal: Sizing.w(16),
        ),
      ),
      onPressed: (){},
      icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png', height: Sizing.h(16),width: Sizing.w(16),),
      label: Text(
        'Login with Google',
        style: TextStyle(
            fontSize: FontSize.bodyRegular
        ),
      ),
    );
  }
}