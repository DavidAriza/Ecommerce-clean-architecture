
import 'package:clean_architecture_getx/data/models/product_model.dart';
import 'package:clean_architecture_getx/domain/entities/product_entity.dart';

final List<ProductModel> productList = [
      ProductModel(
        name: 'Tacos',
        img: 'assets/category_one.svg',
      ),
      ProductModel(
        name: 'Frias',
        img: 'assets/category_two.svg',
      ),
      ProductModel(
        name: 'Burguer',
        img: 'assets/category_three.svg',
      ),
      ProductModel(
        name: 'Pizza',
        img: 'assets/category_four.svg',
      ),
      ProductModel(
        name: 'Burguer',
        img: 'assets/category_five.svg',
      )
    ];
final List<ProductModel> popularList = [
      ProductModel(
        name: 'Pizza Clásica',
        description: 'Salsa clásica de la casa',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductModel(
        name: 'Hamburguesa mix',
        description: 'Doble carne con queso',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductModel(
        name: 'Burguer',
        description: 'Doble carne con queso',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
    ];

    final List<ProductModel> recommendedList = [
      ProductModel(
        name: 'Malteadas tropicales',
        description: 'Elaborado con jugos naturales',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductModel(
        name: 'Malteadas dulces',
        description: 'Elaborado con jugos naturales',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
      ProductModel(
        name: 'Burguer',
         description: 'Doble carne con queso',
        img: 'assets/burger.jpg',
        price: 12.50
      ),
    ];
