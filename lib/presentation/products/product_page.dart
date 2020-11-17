import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/presentation/products/widgets/appBar.dart';
import 'package:clean_architecture_getx/presentation/products/widgets/categories.dart';
import 'package:clean_architecture_getx/presentation/products/widgets/popular_products.dart';
import 'package:clean_architecture_getx/presentation/products/widgets/recommended_products.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(size, context),
      body: _buildBody(size,context),
    );
  }

  Widget _buildBody(Size size, BuildContext context ) {
    final List<ProductEntity> productList = [
      ProductEntity(
        name: 'Tacos',
        img: 'assets/category_one.svg',
      ),
      ProductEntity(
        name: 'Frias',
        img: 'assets/category_two.svg',
      ),
      ProductEntity(
        name: 'Burguer',
        img: 'assets/category_three.svg',
      ),
      ProductEntity(
        name: 'Pizza',
        img: 'assets/category_four.svg',
      ),
      ProductEntity(
        name: 'Burguer',
        img: 'assets/category_five.svg',
      )
    ];
    final List<ProductEntity> popularList = [
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
    ];

    final List<ProductEntity> recommendedList = [
      ProductEntity(
        name: 'Malteadas tropicales',
        description: 'Elaborado con jugos naturales',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductEntity(
        name: 'Malteadas dulces',
        description: 'Elaborado con jugos naturales',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductEntity(
        name: 'Burguer',
         description: 'Doble carne con queso',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
    ];
    return Padding(
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
              child: BuildCategories(productList:productList),
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
              child: BuildPopularProducts(productList: popularList,),
            ),
            SizedBox(height: 15.0,),
            Text(
              'Recomendados',
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15.0,),
            Expanded( 
              flex: 2,
              child: BuildRecommendedProducts(productList: recommendedList,)),
          ],
        ),
    );
  }

  
}
