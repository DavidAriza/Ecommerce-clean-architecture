

import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/domain/usecases/user_usecase.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {

  final UserUseCases userUseCases;

  ProductsController({this.userUseCases});

  RxList<ProductEntity> categories = <ProductEntity>[].obs;
  RxList<ProductEntity> popularProducts = <ProductEntity>[].obs;
  RxList<ProductEntity> recommendedProducts = <ProductEntity>[].obs;

  @override
  void onInit() {
    loadProducts();
    loadPopualarProducts();
    super.onInit();
  }

  void loadProducts() async {

    final categ = await userUseCases.getCategories();
    //final popular = await userUseCases.getPopularProducts();
    final recommended = await userUseCases.getRecommended();

    categories.assignAll(categ);
    //popularProducts.assignAll(popular);
    recommendedProducts.assignAll(recommended);

  }

  void loadPopualarProducts() async {
    final popular = await userUseCases.getPopularProducts();
    popularProducts.assignAll(popular);
  }

}