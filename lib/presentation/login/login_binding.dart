
import 'package:clean_architecture_getx/presentation/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
      userUseCases: Get.find(),
      loginUseCase: Get.find()
    ));
  }

}