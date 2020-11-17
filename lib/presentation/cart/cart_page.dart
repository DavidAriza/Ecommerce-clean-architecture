import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/presentation/cart/widgets/full_cart.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_getx/presentation/cart/widgets/empty_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

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
      body: FullCart(products: [
        ProductEntity(
        name: 'Pizza Clásica',
        description: 'Salsa clásica de la casa',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductEntity(
        name: 'Hamburguesa mix',
        description: 'Doble carne con queso',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductEntity(
        name: 'Burguer',
         description: 'Doble carne con queso',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ],),
    );
  }
}