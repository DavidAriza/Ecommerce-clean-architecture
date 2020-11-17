

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class ProductEntity extends Equatable {

    final String name;
    final String img;
    final String description;
    final double price;

    ProductEntity({
      this.name,
      this.img,
      this.description,
      this.price,
    });

  @override
  List<Object> get props => [name,img,description,price];
}

    // factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
    //     name: json["name"],
    //     img: json["img"],
    //     description: json["description"],
    //     price: json["price"].toDouble(),
    // );

    // Map<String, dynamic> toJson() => {
    //     "name": name,
    //     "img": img,
    //     "description": description,
    //     "price": price,
    // };

