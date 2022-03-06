import 'package:flutter/material.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

class Button extends StatelessWidget {

  final Function onPress;

  const Button({
    Key? key,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(
          vertical: Sizing.h(8),
          horizontal: Sizing.w(16),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: FontSize.bodyRegular
        ),
      ),
    );
  }
}


