import 'package:clean_architecture_getx/presentation/home/cart/cart_controller.dart';
import 'package:clean_architecture_getx/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_getx/presentation/home/cart/cart_page.dart';
import 'package:clean_architecture_getx/presentation/home/products/product_page.dart';
import 'package:clean_architecture_getx/presentation/home/profile/profile_page.dart';
import 'package:clean_architecture_getx/presentation/home/widgets/custom_navigation_bar.dart';
import 'package:get/get.dart';


class HomePage extends GetWidget<HomeController> {

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(
              () {
                return controller.indexSelected.value != null ? IndexedStack(
                index: controller.indexSelected.value,
                children: [
                  ProductPage(),
                  Placeholder(),
                  CartPage(
                    onShopping: (){
                      controller.indexSelected.value=0;
                    },
                  ),
                  Placeholder(),
                  ProfilePage(),
                ],
              ) : SizedBox.shrink();}               
            ),
          ),
          Obx(
            () => CustomNavigationBar(
              //totalCartItems: cartController.totalItems.value,
              index: controller.indexSelected.value,
              onIndexSelected: (index) {
                controller.updateIndex(index);
                // setState(() {
                //   currentIndex = index;
                // });
              },
            ),
          )
        ],
      ),
    );
  }
}

