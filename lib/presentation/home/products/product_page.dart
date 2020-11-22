import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/presentation/home/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:clean_architecture_getx/presentation/home/products/widgets/appBar.dart';
import 'package:clean_architecture_getx/presentation/home/products/widgets/categories.dart';
import 'package:clean_architecture_getx/presentation/home/products/widgets/popular_products.dart';
import 'package:clean_architecture_getx/presentation/home/products/widgets/recommended_products.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(size, context),
      body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore categories',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Theme.of(context).secondaryHeaderColor),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Expanded( 
                flex: 1,
                child: BuildCategories(),
              ),
              SizedBox(height: 15.0,),
              Text(
                'Popular products',
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0,),
              Expanded( 
                flex: 3,
                child: BuildPopularProducts(),
              ),
              SizedBox(height: 15.0,),
              Text(
                'Recommended Products',
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.0,),
              Expanded( 
                flex: 2,
                child: BuildRecommendedProducts()),
            ],
        ),
      )
    );
  }
  
}
