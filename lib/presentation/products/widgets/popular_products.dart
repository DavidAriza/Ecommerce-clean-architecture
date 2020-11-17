import 'package:clean_architecture_getx/presentation/product_detail/product_detail.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_getx/domain/entities/product_entity.dart';


class BuildPopularProducts extends StatelessWidget {

  final List<ProductEntity> productList;

  BuildPopularProducts({Key key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, i) => _popularProduct(productList[i], context, size),
      separatorBuilder: (context, index) => SizedBox(width: 10.0,),
    );
  }
  
  Widget _popularProduct(ProductEntity product, BuildContext context, Size size) {
    return 
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Container(
                    width: size.width*0.45,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(product.img,),
                            )
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            product.name,
                            style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).accentColor),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            child: Text(
                              product.description,
                              style: Theme.of(context).textTheme.caption.copyWith( color: Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '\$${product.price}',
                            style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: Icon(Icons.favorite_border_outlined, color: Theme.of(context).secondaryHeaderColor)
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: GestureDetector(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).textTheme.caption.color
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProductDetailPage(product: product,))),
              )
            )
          ],
        );
        //Icon(Icons.favorite_border_outlined, color: Theme.of(context).secondaryHeaderColor )
      
  }

}