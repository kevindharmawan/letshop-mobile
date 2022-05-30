import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:letshop_mobile/utils/constants/storage_keys.dart';
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


    var _signedIn = await _storage.read(StorageKeys.isSignedIn);

    if (_signedIn != null && _signedIn) {
      Get.offNamed(AppRoutes.home);
      return;
    }

    Get.offNamed(AppRoutes.auth);

    Get.offNamed(AppRoutes.home);

  }
}
