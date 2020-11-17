import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/product_detail/widgets/product_detail_bottom_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {

  final ProductEntity product;
  
  const ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(              
              children: [
                Container(
                  height: size.height*0.6,
                  width: double.infinity,
                  child: Image.asset(
                    product.img,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                  margin: EdgeInsets.only(top: size.height*0.5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    )
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description'),
                      Text(product.description),
                      Text('Ingredientes')
                    ],
                  ),
                ), 
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    title: Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold, color: AppColors.white), 
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                    child: productDetailBottomBar(context, size, product.price),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}