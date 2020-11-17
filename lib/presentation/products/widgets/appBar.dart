import 'package:flutter/material.dart';

  AppBar buildAppBar(Size size, BuildContext context) {
    return AppBar(
      leadingWidth: size.width * 0.6, 
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color,),
            hintText: 'Search'
          ),
        ),
      ),
      title: Text(
        'Home',
        style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Icon(Icons.add_alert_outlined, color: Theme.of(context).textTheme.headline4.color,),
        Icon(Icons.add_shopping_cart_outlined, color: Theme.of(context).textTheme.headline4.color),
        SizedBox(width: 8.0,)
      ],
    );
  }
