import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:letshop_mobile/utils/device/sizing.dart';
import 'package:letshop_mobile/utils/routes/_routes.dart';

class SplashController extends GetxController {
  // TODO: Implement already sign in or not sign in
  final _storage = GetStorage();

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 2));

    while (!Sizing.loaded()) {
      await Future.delayed(const Duration(seconds: 1));
    }

    Get.offNamed(AppRoutes.auth);
  }
}
