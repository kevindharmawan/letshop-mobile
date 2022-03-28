import 'package:flutter/material.dart';
import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';

class SettingsButton extends StatelessWidget {

  final String ? str;

  const SettingsButton(
    this.str, {
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0x32000000)),
        ),
      ),
        padding: EdgeInsets.symmetric(
          horizontal: Sizing.w(5),
          vertical: Sizing.h(10),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container( 
                margin: EdgeInsets.only(left: Sizing.w(8), right: Sizing.w(20)),
                child: Icon(
                  Icons.settings,
                  size: 30)),
              Text(
                this.str ?? 'Settings ...',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: FontSize.subheading,
                  height: 1.5,
              )),
            ],
          ),
          Container( 
            margin: EdgeInsets.only(right: Sizing.w(10)),
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 30)),
        ]));
  }

}