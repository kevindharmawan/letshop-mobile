import 'package:flutter/material.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

class SocialButton extends StatelessWidget {

  final Function() onPress;
  final String text;
  final String imageUrl;

  const SocialButton({
    Key? key,
    required this.onPress,
    required this.text,
    required this.imageUrl,

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
      onPressed: onPress,
      icon: Image.network(imageUrl, height: Sizing.h(16),width: Sizing.w(16),),
      label: Text(
        text,
        style: TextStyle(
            fontSize: FontSize.bodyRegular
        ),
      ),
    );
  }
}