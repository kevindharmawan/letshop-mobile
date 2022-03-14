import 'package:flutter/material.dart';
import 'package:letshop_mobile/shared/buttons/settings_button.dart';

import 'package:letshop_mobile/utils/constants/font_size.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/theme/theme_constant.dart';


class AccountSettingsView extends StatelessWidget {

  IconData logout = IconData(0xe3b3, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: Sizing.w(24),
          vertical: Sizing.h(28),
        ),
        child: Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama User',
                      style: TextStyle(fontSize: FontSize.heading3),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Change your settings',
                      style: TextStyle(fontSize: FontSize.subheading),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Container(
                    height: Sizing.w(64),
                    width: Sizing.w(64),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                        ))
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1.0, color: Color(0x32000000)),),
              ),
              margin: EdgeInsets.only(
                  top: Sizing.h(24),
                  bottom: Sizing.h(10)
              ),
              child: Column(
                children: [
                  SettingsButton('User Settings'),
                  SettingsButton('Store Settings'),
                  SettingsButton('Seller Mode'),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1.0, color: Color(0x32000000)),),
              ),
              margin: EdgeInsets.symmetric(vertical: Sizing.h(10)),
              child: Column(
                children: [
                  SettingsButton('Shipping Address'),
                  SettingsButton('???'),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1.0, color: Color(0x32000000)),),
              ),
              margin: EdgeInsets.symmetric(vertical: Sizing.h(10)),
              child: Column(
                children: [
                  SettingsButton('Change Password'),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.0, color: Color(0x32000000))),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizing.w(5),
                        vertical: Sizing.h(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Sizing.w(8), right: Sizing.w(20)),
                            child: Icon(
                              logout,
                              size: 30,
                              color: themeController.error,
                            )),
                          Text(
                            'Logout',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: FontSize.subheading,
                                height: 1.5,
                                color: themeController.error
                            )),
                        ],
                      ))],
              ),
            ),
          ],
        ));
  }
}