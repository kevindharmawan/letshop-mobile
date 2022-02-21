import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:letshop_mobile/utils/constants/storage_keys.dart';
import 'package:letshop_mobile/utils/theme/colors/_colors.dart';
import 'package:letshop_mobile/utils/theme/shadows/_shadows.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = StorageKeys.isDarkModeColor;

  var primaryLow = LightModeColor.primaryLow;
  var primary = LightModeColor.primary;
  var primaryHigh = LightModeColor.primaryHigh;

  var warning = LightModeColor.warning;
  var error = LightModeColor.error;
  var onColor = LightModeColor.onColor;

  var background = LightModeColor.background;
  var onBackground = LightModeColor.onBackground;
  var elevated = LightModeColor.elevated;
  var onElevated = LightModeColor.onElevated;

  var border = LightModeColor.border;
  var outline = LightModeColor.outline;

  var shadowSm = LightModeShadow.sm;
  var shadowMd = LightModeShadow.md;
  var shadowLg = LightModeShadow.lg;

  @override
  void onInit() {
    super.onInit();
    var _isDarkModeColor = _box.read(_key) ?? false;
    _updateColor(_isDarkModeColor);
  }

  void saveTheme(bool isDarkModeColor) async {
    await _box.write(_key, isDarkModeColor);
    _updateColor(isDarkModeColor);
  }

  void _updateColor(bool isDarkModeColor) {
    if (isDarkModeColor) {
      _updateToDarkModeColor();
    } else {
      _updateToLightModeColor();
    }
    update();
  }

  void _updateToLightModeColor() {
    primaryLow = LightModeColor.primaryLow;
    primary = LightModeColor.primary;
    primaryHigh = LightModeColor.primaryHigh;

    warning = LightModeColor.warning;
    error = LightModeColor.error;
    onColor = LightModeColor.onColor;

    background = LightModeColor.background;
    onBackground = LightModeColor.onBackground;
    elevated = LightModeColor.elevated;
    onElevated = LightModeColor.onElevated;

    border = LightModeColor.border;
    outline = LightModeColor.outline;

    shadowSm = LightModeShadow.sm;
    shadowMd = LightModeShadow.md;
    shadowLg = LightModeShadow.lg;
  }

  void _updateToDarkModeColor() {
    primaryLow = DarkModeColor.primaryLow;
    primary = DarkModeColor.primary;
    primaryHigh = DarkModeColor.primaryHigh;

    warning = DarkModeColor.warning;
    error = DarkModeColor.error;
    onColor = DarkModeColor.onColor;

    background = DarkModeColor.background;
    onBackground = DarkModeColor.onBackground;
    elevated = DarkModeColor.elevated;
    onElevated = DarkModeColor.onElevated;

    border = DarkModeColor.border;
    outline = DarkModeColor.outline;

    shadowSm = DarkModeShadow.sm;
    shadowMd = DarkModeShadow.md;
    shadowLg = DarkModeShadow.lg;
  }
}
