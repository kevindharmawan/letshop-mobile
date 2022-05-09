import 'package:flutter/material.dart';
import 'package:letshop_mobile/shared/buttons/settings_button.dart';
import 'package:letshop_mobile/utils/routes/_routes.dart';
import 'package:get/get.dart';

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
                    GestureDetector(
                      onTap: (){
                        print("Tapped Change Your Settings");
                      },
                      child: Text(
                        'Change your settings',
                        style: TextStyle(fontSize: FontSize.subheading),
                        textAlign: TextAlign.left,
                      ))]),
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
                  GestureDetector(
                    onTap: (){
                      print("Tapped User Settings");
                      Get.offNamed(AppRoutes.userSettings);
                    },
                    child: SettingsButton('User Settings'),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("Tapped Store Settings");
                    },
                    child: SettingsButton('Store Settings'),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("Tapped Seller Mode");
                    },
                    child: SettingsButton('Seller Mode'),
                  ),
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
                  GestureDetector(
                    onTap: (){
                      print("Tapped Shipping Address");
                    },
                    child: SettingsButton('Shipping Address'),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("Tapped ???");
                    },
                    child: SettingsButton('???'),
                  )],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1.0, color: Color(0x32000000)),),
              ),
              margin: EdgeInsets.symmetric(vertical: Sizing.h(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      print("Tapped Change Password");
                    },
                    child: SettingsButton('Change Password')
                  ),
                  GestureDetector(
                      onTap: (){
                        print("Tapped Logout");
                      },
                      child: Container(
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
                            ]
                          )
                      )
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
