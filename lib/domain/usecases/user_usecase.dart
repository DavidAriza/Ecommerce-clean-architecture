

import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/repositories/local_storage_repository.dart';

class UserUseCases {

  final LocalStorageRepository _localStorageRepository;

  UserUseCases(this._localStorageRepository);

  
  Future<void> clearAllData() async {
    return await _localStorageRepository.clearAllData(); 
  }


  Future<String> getToken() async {
    return await _localStorageRepository.getToken(); 
  }


  Future<String> saveToken(String token) async {
    return await _localStorageRepository.saveToken(token); 
  } 


  Future<UserEntity> getUser() async {
   return await _localStorageRepository.getUser(); 
  }


  Future<UserEntity> saveUser(UserEntity user) async {
    return await _localStorageRepository.saveUser(user); 
  } 

}