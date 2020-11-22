

import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/repositories/local_storage_repository.dart';

class UserUseCases {

  final LocalStorageRepository localStorageRepository;

  UserUseCases({this.localStorageRepository});

  
  Future<void> clearAllData() async {
    return await localStorageRepository.clearAllData(); 
  }


  Future<String> getToken() async {
    return await localStorageRepository.getToken(); 
  }


  Future<String> saveToken(String token) async {
    return await localStorageRepository.saveToken(token); 
  } 


  Future<UserEntity> getUser() async {
   return await localStorageRepository.getUser(); 
  }


  Future<UserEntity> saveUser(UserEntity user) async {
    return await localStorageRepository.saveUser(user); 
  } 

  Future<bool> isDarkTheme( ) async {
    return await localStorageRepository.isDarkTheme(); 
  } 

  Future<void> saveDarkTheme(bool darkTheme ) async {
    return await localStorageRepository.saveDarkTheme(darkTheme); 
  } 

  Future<List<ProductEntity>> getCategories() async {
    return await localStorageRepository.getCategories();
  }

  Future<List<ProductEntity>> getPopularProducts() async {
    return await localStorageRepository.getPopularProducts();
  }

  Future<List<ProductEntity>> getRecommended() async {
    return await localStorageRepository.getRecommended();
  }



}