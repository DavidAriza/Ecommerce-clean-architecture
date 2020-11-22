import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:clean_architecture_getx/presentation/home/cart/cart_controller.dart';
import 'package:clean_architecture_getx/presentation/home/cart/widgets/empty_cart.dart';
import 'package:clean_architecture_getx/presentation/home/cart/widgets/full_cart.dart';

class CartPage extends GetWidget<CartController> {

  final VoidCallback onShopping; 
  CartPage({Key key, this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
          () => controller.cartList.isEmpty 
          ? EmptyCart(
            onShopping: onShopping,
          )
          : FullCart(),
      )
    );
  }
}