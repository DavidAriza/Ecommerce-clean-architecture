import 'package:equatable/equatable.dart';

import 'package:clean_architecture_getx/domain/entities/product_entity.dart';

class CartItem  {
  
  final ProductEntity product;
   int quantity;

  CartItem({this.product, this.quantity=1});
  




}