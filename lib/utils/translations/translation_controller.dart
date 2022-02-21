import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:letshop_mobile/utils/constants/_constants.dart';

class TranslationController extends GetxController {
  final _storage = GetStorage();
  final _key = StorageKeys.selectedLanguage;

  @override
  void onInit() async {
    super.onInit();

    var languageCode = _storage.read(_key) ?? 'en';
    var locale = Locale(languageCode);
    await Get.updateLocale(locale);
  }

  void changeLanguage(String languageCode) async {
    var locale = Locale(languageCode);
    await _storage.write(_key, languageCode);
    await Get.updateLocale(locale);
  }
}
