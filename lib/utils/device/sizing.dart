import 'package:flutter/material.dart';

class Sizing {
  static late double widthRatio;
  static late double heightRatio;
  static late bool isWideScreen;

  static bool isLoaded = false;

  Sizing(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    var screenWidth = mediaQueryData.size.width;
    var screenHeight = mediaQueryData.size.height;

    widthRatio = screenWidth / 360;
    heightRatio = screenHeight / 640;

    if (screenWidth > screenHeight) {
      isWideScreen = true;
    } else {
      isWideScreen = false;
    }

    isLoaded = true;
  }

  static double w(double width) => widthRatio * width;
  static double h(double height) => heightRatio * height;

  static bool isWide() => isWideScreen;
  static bool loaded() => isLoaded;
}
