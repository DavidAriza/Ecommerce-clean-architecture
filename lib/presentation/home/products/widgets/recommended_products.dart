import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_getx/presentation/home/products/products_controller.dart';
import 'package:clean_architecture_getx/domain/entities/product_entity.dart';


class BuildRecommendedProducts extends StatelessWidget {

  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(
        () => controller.recommendedProducts.isNotEmpty 
          ? ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.recommendedProducts.length,
            itemBuilder: (context, i) => _recommendedProduct(controller.recommendedProducts[i], context, size),
            separatorBuilder: (context, index) => SizedBox(width: 10.0,),
          )
          : Center(child: CircularProgressIndicator(),)
    );
  }
  
  Widget _recommendedProduct(ProductEntity product, BuildContext context, Size size) {
    return 
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [           
                      Card(
                        color: Theme.of(context).backgroundColor,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Container(
                          height: size.width/3.0,
                          width: size.width*0.7,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 0.0),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),                       
                                ],
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Naturales',
                                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Theme.of(context).secondaryHeaderColor),
                                        ),
                                        Spacer(),
                                        Icon(Icons.favorite_border_outlined, color: Theme.of(context).secondaryHeaderColor)
                                      ],
                                    ),
                                    Text(
                                      product.name,
                                      style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).accentColor),
                                    ),
                                    Flexible(
                                      child: Text(
                                        product.description,
                                        style: Theme.of(context).textTheme.caption.copyWith( color: Theme.of(context).secondaryHeaderColor, fontSize: 10)
                                      ),
                                    ),
                                    Text(
                                      '\$${product.price}',
                                      style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                    child: GestureDetector(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).textTheme.caption.color
                      ),
                      onTap: () {},
                    )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 13.0),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Image.asset(
                product.img,
                fit: BoxFit.cover,
                
              ),
            ), 
          ],
        );  
  }

}