
import 'package:clean_architecture_getx/data/datasource/local_storage_data_source.dart';
import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {

  final LocalStorageDataSource localStorageDataSource;

  LocalStorageRepositoryImpl({this.localStorageDataSource});

  @override
  Future<void> clearAllData() async {
    return await localStorageDataSource.clearAllData(); 
  }

  @override
  Future<String> getToken() async {
    return await localStorageDataSource.getToken(); 
  }

  @override
  Future<String> saveToken(String token) async {
    return await localStorageDataSource.saveToken(token); 
  }

  @override
  Future<UserEntity> getUser() async {
   return await localStorageDataSource.getUser(); 
  }

  @override
  Future<UserEntity> saveUser(UserEntity user) async {
    return await localStorageDataSource.saveUser(user); 
  }

  @override
  Future<bool> isDarkTheme() async {
    return await localStorageDataSource.isDarkTheme();
  }

  @override
  Future<void> saveDarkTheme(bool isDark) async {
    return await localStorageDataSource.saveDarkTheme(isDark);
  }

  @override
  Future<List<ProductEntity>> getCategories() async {
    return await localStorageDataSource.getCategories();
  }

  @override
  Future<List<ProductEntity>> getPopularProducts() async {
    return await localStorageDataSource.getPopularProducts();
  }

  @override
  Future<List<ProductEntity>> getRecommended() async {
    return await localStorageDataSource.getRecommended();
  }

  


}