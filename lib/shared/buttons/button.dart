import 'package:flutter/material.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

class Button extends StatelessWidget {

  final Function() onPress;
  final String text;

  const Button({
    Key? key,
    required this.onPress,
    required this.text
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
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
            fontSize: FontSize.bodyRegular
        ),
      ),
    );
  }
}


