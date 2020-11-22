

import 'package:clean_architecture_getx/domain/repositories/api_repository.dart';
import 'package:clean_architecture_getx/domain/repositories/local_storage_repository.dart';
import 'package:clean_architecture_getx/domain/usecases/login_usecase.dart';
import 'package:clean_architecture_getx/domain/usecases/user_usecase.dart';
import 'package:clean_architecture_getx/global/routes/routes.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController{

 
  final UserUseCases userUseCases;
  final LoginUseCase loginUseCase;

  SplashController({this.userUseCases, this.loginUseCase,});

  @override
  void onInit() {
    validateTheme();
    super.onInit();
  }

  @override
  void onReady() {
    validateSesion();
    super.onReady();
  }
  void validateTheme() async {
    final isDark = await userUseCases.isDarkTheme();
    if(isDark != null) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
      await userUseCases.saveDarkTheme(isDark);
    } else {
      await userUseCases.saveDarkTheme(Get.isDarkMode); //agregado
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);

    }
  }

  void validateSesion() async {
    final token = await userUseCases.getToken();
    if(token != null) {
      final user = await loginUseCase.getUserFromToken(token);
      await userUseCases.saveUser(user);
      Get.offNamed(AppRoutes.home);
    } else {
      await Future.delayed(Duration(seconds: 3));
      Get.offNamed(AppRoutes.login);
    }
  }

}