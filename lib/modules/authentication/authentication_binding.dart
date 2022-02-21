import 'package:get/get.dart';
import 'package:letshop_mobile/modules/authentication/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
  }
}
