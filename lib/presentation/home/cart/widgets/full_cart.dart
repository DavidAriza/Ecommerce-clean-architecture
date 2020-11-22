import 'dart:wasm';

import 'package:clean_architecture_getx/domain/entities/cart_item.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/home/cart/cart_controller.dart';
import 'package:clean_architecture_getx/presentation/login/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullCart extends GetWidget<CartController> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle style1 = Theme.of(context).textTheme.caption;
    final TextStyle style2 = Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Obx(
                () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.cartList.length,
                itemBuilder: (context, i) => CartProduct(
                  cartItem: controller.cartList[i],
                  size: size,
                  onIncrement: () {
                    controller.increment(controller.cartList[i]);
                  },
                  onDecrement: () {
                    controller.decrement(controller.cartList[i]);
                  },
                  onDelete: (){
                    controller.deleteFromCart(controller.cartList[i]);
                  },
                ) 
              ),
            ),
          )
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20,50,20,20),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).selectedRowColor
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,30,20,20),
                  child: Column(
                    children: [
                      Obx(
                        () =>  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( 'Sub total',  style: style1,),
                            Text('\$${controller.totalCost.value} usd', style: style1,)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery', style: style1,),
                          Text('Free', style: style1,)
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',style: style2,),
                            Text('\$${controller.totalCost.value} usd', style: style2,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GradientButton(
                  text: 'Checkout',
                  context: context,
                  width: size.width
                )
              ],
            ),
          )
         )
      ],
    );
  }
}

class CartProduct extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final CartItem cartItem;
  final Size size;
   CartProduct({Key key, this.cartItem, this.size, this.onDelete, this.onIncrement, this.onDecrement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Card(
              color: Theme.of(context).backgroundColor,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Container(
                width: size.width*0.6,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(cartItem.product.img,),
                        )
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      cartItem.product.name,
                      style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).accentColor),
                    ),
                    FittedBox(
                      child: Text(
                        cartItem.product.description,
                        style: Theme.of(context).textTheme.caption.copyWith( color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onDecrement,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(
                              Icons.remove,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Text('${cartItem.quantity}'),
                        ),
                        GestureDetector(
                          onTap: onIncrement,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${cartItem.product.price}',
                          style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: onDelete,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.pink,
                  child: Icon(
                    Icons.delete_outline,
                    color: AppColors.white,
                  ),
                )
              ),
            )
          ],
      ),
    );
  }
}