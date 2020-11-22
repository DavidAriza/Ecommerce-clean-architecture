import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

abstract class LocalStorageRepository {

  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<UserEntity> saveUser(UserEntity user);
  Future<UserEntity> getUser();
  Future<bool> isDarkTheme();
  Future<void> saveDarkTheme(bool darkTheme); 
  Future<List<ProductEntity>> getCategories();
  Future<List<ProductEntity>> getPopularProducts();
  Future<List<ProductEntity>> getRecommended();
 
}