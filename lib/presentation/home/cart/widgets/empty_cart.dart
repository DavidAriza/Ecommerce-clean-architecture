import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_getx/presentation/home/cart/cart_controller.dart';
import 'package:get/get.dart';


class EmptyCart extends GetWidget<CartController> {

  final VoidCallback onShopping;

  EmptyCart({Key key, this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://www.iconsdb.com/icons/preview/soylent-red/sad-xxl.png',
            height: 90,
          ),
          Text(
            'Your cart is empty',
            textAlign: TextAlign.center,
          ),
          Center(
            child: RaisedButton(
              color: AppColors.purple,
              textColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              onPressed: onShopping,
              child: Text(
                'Go home'
              ),             
            ),
          )
        ],
      );
  }
}