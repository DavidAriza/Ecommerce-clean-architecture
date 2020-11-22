

import 'package:clean_architecture_getx/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{

  ProductModel({
    String name,
    String img,
    String description,
    num price
  }) : super(description: description, name: name, img: img, price: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        img: json["img"],
        description: json["description"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "description": description,
        "price": price,
    };

}