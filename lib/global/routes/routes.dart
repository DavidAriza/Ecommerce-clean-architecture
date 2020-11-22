
import 'package:clean_architecture_getx/main_binding.dart';
import 'package:clean_architecture_getx/presentation/home/home_binding.dart';
import 'package:clean_architecture_getx/presentation/home/home_page.dart';
import 'package:clean_architecture_getx/presentation/login/login_binding.dart';
import 'package:clean_architecture_getx/presentation/login/login_page.dart';
import 'package:clean_architecture_getx/presentation/splash/splash_binding.dart';
import 'package:clean_architecture_getx/presentation/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRoutes {

  static final String splash = '/splash';
  static final String login = '/login';
  static final String home = '/home';

}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: ()=> SplashPage(),
      binding: SplashBinding()
    ),
    GetPage(
      name: AppRoutes.login,
      page: ()=> LoginPage(),
      bindings: [MainBinding(), LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: ()=> HomePage(),
      bindings: [ MainBinding(), HomeBinding()],
    ),
  ];
}