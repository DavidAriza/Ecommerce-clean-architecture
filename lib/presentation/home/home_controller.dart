

import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/usecases/login_usecase.dart';
import 'package:clean_architecture_getx/domain/usecases/user_usecase.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final UserUseCases userUseCases;
  final LoginUseCase loginUseCase;

  HomeController({this.loginUseCase, this.userUseCases});

  Rx<UserEntity> user = UserEntity.empty().obs;
  RxInt indexSelected = 0.obs;
  RxBool isDark = false.obs;

  @override
  void onInit() {
    loadCurrentTheme();
    super.onInit();
  }

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void updateIndex(int index) {
    indexSelected (index); 
  }

  void loadUser(){
    userUseCases.getUser().then((value) {
      user(value);
    });
  }

  Future<void> logOut() async {
    final token = await userUseCases.getToken();
    await loginUseCase.logout(token);
    final isDark = await userUseCases.isDarkTheme();
    await userUseCases.saveDarkTheme(isDark);
    await userUseCases.clearAllData();
  }

  void loadCurrentTheme(){
    userUseCases.isDarkTheme().then((value) {
      isDark(value);
    });
  }

  bool onChangeTheme(bool isDarkTheme) {
    userUseCases.saveDarkTheme(isDarkTheme);
    isDark(isDarkTheme);
    return isDarkTheme;
  }

}