import 'package:clean_architecture_getx/presentation/cart/cart_page.dart';
import 'package:clean_architecture_getx/presentation/home/widgets/custom_navigation_bar.dart';
import 'package:clean_architecture_getx/presentation/products/product_page.dart';
import 'package:clean_architecture_getx/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                ProductPage(),
                Text(currentIndex.toString()),
                CartPage(),
                Text(currentIndex.toString()),
                ProfilePage(),
                
              ],
            ),
          ),
          CustomNavigationBar(
            index: currentIndex,
            onIndexSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          )
        ],
      ),
    );
  }
}