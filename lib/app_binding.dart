import 'package:get/get.dart';
import 'package:letshop_mobile/utils/theme/theme_controller.dart';
import 'package:letshop_mobile/utils/translations/translation_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(TranslationController());
    Get.put(ThemeController());
  }
}
