
import 'package:clean_architecture_getx/data/datasource/local_storage_data_source.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {

  final LocalStorageDataSource _localStorageDataSource;

  LocalStorageRepositoryImpl(this._localStorageDataSource);

  @override
  Future<void> clearAllData() async {
    return await _localStorageDataSource.clearAllData(); 
  }

  @override
  Future<String> getToken() async {
    return await _localStorageDataSource.getToken(); 
  }

  @override
  Future<String> saveToken(String token) async {
    return await _localStorageDataSource.saveToken(token); 
  }

  @override
  Future<UserEntity> getUser() async {
   return await _localStorageDataSource.getUser(); 
  }

  @override
  Future<UserEntity> saveUser(UserEntity user) async {
    return await _localStorageDataSource.saveUser(user); 
  }

  


}