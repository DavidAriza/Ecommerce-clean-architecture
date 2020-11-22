import 'package:clean_architecture_getx/presentation/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
      userUseCases: Get.find(),
      loginUseCase: Get.find()
      
    ));
  }


}