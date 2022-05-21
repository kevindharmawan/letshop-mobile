import 'package:get/get.dart';
import 'package:letshop_mobile/modules/authentication/_authentication.dart';
import 'package:letshop_mobile/modules/home/_home.dart';
import 'package:letshop_mobile/modules/home/home_binding.dart';
import 'package:letshop_mobile/modules/splash/_splash.dart';
import '../../modules/settings/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
      children: [
        GetPage(
          name: AppRoutes.login,
          page: () => LoginView(),
        ),
        GetPage(
          name: AppRoutes.register,
          page: () => RegisterView(),
        ),
        GetPage(
          name: AppRoutes.forget,
          page: () => ForgetPasswordView(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
    ),
  ];
}
