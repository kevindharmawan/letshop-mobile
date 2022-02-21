import 'package:flutter/cupertino.dart';
import 'package:letshop_mobile/utils/theme/colors/dark_mode.dart';

class DarkModeShadow {
  static var shadowMain = DarkModeColor.outline;
  static var shadowSpread = DarkModeColor.border;

  static var sm = [
    BoxShadow(
      color: shadowMain,
      blurRadius: 2.0,
      offset: Offset.fromDirection(1.0),
    ),
    BoxShadow(
      color: shadowSpread,
      blurRadius: 3.0,
      spreadRadius: 1.0,
      offset: Offset.fromDirection(1.0),
    ),
  ];

  static var md = [
    BoxShadow(
      color: shadowMain,
      blurRadius: 2.0,
      offset: Offset.fromDirection(1.0),
    ),
    BoxShadow(
      color: shadowSpread,
      blurRadius: 6.0,
      spreadRadius: 2.0,
      offset: Offset.fromDirection(2.0),
    ),
  ];

  static var lg = [
    BoxShadow(
      color: shadowMain,
      blurRadius: 3.0,
      offset: Offset.fromDirection(1.0),
    ),
    BoxShadow(
      color: shadowSpread,
      blurRadius: 8.0,
      spreadRadius: 3.0,
      offset: Offset.fromDirection(4.0),
    ),
  ];
}
