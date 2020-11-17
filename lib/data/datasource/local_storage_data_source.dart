import 'package:clean_architecture_getx/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

abstract class LocalStorageDataSource {

  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<UserEntity> saveUser(UserEntity user);
  Future<UserEntity> getUser();

}

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_image = 'IMAGE';

class LocalStorageDataSourceImp extends LocalStorageDataSource {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<UserEntity> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString(_pref_username);
    final name = sharedPreferences.getString(_pref_name);
    final image = sharedPreferences.getString(_pref_image);

    final user = UserModel(
      name: name,
      username: username,
      image: image,
    );

    return user;
  }

  @override
  Future<UserEntity> saveUser(UserEntity user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username, user.username);
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_image, user.image);
    return user;
  }

  

}