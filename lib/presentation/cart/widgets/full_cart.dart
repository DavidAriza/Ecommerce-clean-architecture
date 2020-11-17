import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/login/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class FullCart extends StatefulWidget {

  final List<ProductEntity> products;

  FullCart({Key key, this.products}) : super(key: key);

  @override
  _FullCartState createState() => _FullCartState();
}

class _FullCartState extends State<FullCart> {
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.products.length,
              itemBuilder: (context, i) => CartProduct(
                product: widget.products[i],
                size: size,
              ) 
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub total', style: style1,),
                          Text('\$85.00 usd', style: style1,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery', style: style1,),
                          Text('Free', style: style1,)
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',style: style2,),
                          Text('\$85.00 usd', style: style2,)
                        ],
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
  final ProductEntity product;
  final Size size;
  const CartProduct({Key key, this.product, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: Alignment.topRight,
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
                        image: AssetImage(product.img,),
                      )
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.caption.copyWith(color: Theme.of(context).accentColor),
                  ),
                  FittedBox(
                    child: Text(
                      product.description,
                      style: Theme.of(context).textTheme.caption.copyWith( color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
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
                        child: Text('2'),
                      ),
                      GestureDetector(
                        onTap: (){},
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
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.pink,
              child: Icon(
                Icons.delete_outline,
                color: AppColors.white,
              ),
            )
          )
        ],
      ),
    );
  }
}