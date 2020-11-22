

import 'package:clean_architecture_getx/domain/entities/cart_item.dart';
import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:get/get.dart';

class CartController extends GetxController{


  RxList<CartItem> cartList = <CartItem>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalCost = 0.0.obs;
  RxMap<String,double> itemCost = <String, double>{}.obs;
  RxList<Map<String,double>> eachItemPrice = <Map<String,double>>[].obs;

  void add(ProductEntity product ) {
    final temp = List<CartItem>.from(cartList);
    bool found = false;
    for(CartItem p in temp) {
      if(p.product.name == product.name){
        p.quantity += 1;
        found = true;
        break;
      }
    }

    if(!found) {
      temp.add(CartItem(product: product));
    }

    cartList.assignAll(temp);
    countTotalItems(temp);
  }

  void increment(CartItem product) {
    final temp = List<CartItem>.from(cartList);
    product.quantity += 1;
    
    cartList.assignAll(temp);
    countTotalItems(cartList);
  }

  void decrement(CartItem product) {
    final temp = List<CartItem>.from(cartList);
    if(product.quantity > 1 ){
          product.quantity -= 1;
    }
    cartList.assignAll(temp);
    countTotalItems(cartList);
  }

  void countTotalItems (List<CartItem> list) {
    int total = list.fold(0, (previousValue, element) => element.quantity + previousValue);
    double totalCart = list.fold(0, (previousValue, element) => (element.quantity*element.product.price) + previousValue);
    list.forEach((element) {
      itemCost({
        'element.product.name' : element.quantity*element.product.price
      });
      eachItemPrice.assign(itemCost);
    });
    totalCost(totalCart);
    totalItems(total);

  }

  void totalPrice(List<CartItem> list) {
    
  }

  void deleteFromCart(CartItem product) {
    cartList.remove(product);
    countTotalItems(cartList);
  }
  



}