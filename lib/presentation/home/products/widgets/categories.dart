import 'package:clean_architecture_getx/presentation/home/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:get/get.dart';


class BuildCategories extends StatelessWidget {

  // final List<ProductEntity> productList;
  final controller = Get.find<ProductsController>();
  // BuildCategories({Key key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
        () => controller.categories.isNotEmpty 
          ? ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, i) => _categoryItem(controller.categories[i], context, size),
            separatorBuilder: (context, index) => SizedBox(width: 20.0,),
          )
          : Center(child: CircularProgressIndicator(),),
    );
  }
  
  Widget _categoryItem(ProductEntity product, BuildContext context, Size size) {
    return Column(
      
      children: [
        Container( 
          height: size.width*0.156,
          width: size.width*0.156,
          child: Center(child: SvgPicture.asset(product.img)),
          decoration: BoxDecoration(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.3) ,
            borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        Flexible(
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).inputDecorationTheme.labelStyle.color),
          ),
        )
      ],
    );
  }

}