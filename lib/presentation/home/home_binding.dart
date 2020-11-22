import 'package:get/instance_manager.dart';

import 'package:clean_architecture_getx/presentation/home/cart/cart_controller.dart';
import 'package:clean_architecture_getx/presentation/home/home_controller.dart';
import 'package:clean_architecture_getx/presentation/home/products/products_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      userUseCases: Get.find(),
      loginUseCase: Get.find()
      
    ));

    Get.lazyPut(() => ProductsController(
      userUseCases: Get.find(),
    ));
    
    Get.lazyPut(() => CartController());

  }

}