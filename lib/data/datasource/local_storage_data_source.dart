import 'package:clean_architecture_getx/data/models/product_model.dart';
import 'package:clean_architecture_getx/data/models/user_model.dart';
import 'package:clean_architecture_getx/domain/entities/product_entity.dart';
import 'package:clean_architecture_getx/global/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

abstract class LocalStorageDataSource {

  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<UserModel> saveUser(UserModel user);
  Future<UserModel> getUser();
  Future<void> saveDarkTheme(bool darkTheme);
  Future<bool> isDarkTheme();
  Future<List<ProductModel>> getCategories();
  Future<List<ProductModel>> getPopularProducts();
  Future<List<ProductModel>> getRecommended();
}

const _pref_token = 'TOKEN';
const _pref_username = 'USERNAME';
const _pref_name = 'NAME';
const _pref_image = 'IMAGE';
const _pref_dark_theme = 'THEME_DARK';

class LocalStorageDataSourceImpl extends LocalStorageDataSource {
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
  Future<UserModel> getUser() async {
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
  Future<UserModel> saveUser(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username, user.username);
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_image, user.image);
    return user;
  }

  @override
  Future<bool> isDarkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_pref_dark_theme);
  }

  @override
  Future<void> saveDarkTheme(bool darkTheme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_pref_dark_theme, darkTheme);
  }

  @override
  Future<List<ProductModel>> getCategories() async {
    await Future.delayed(Duration(seconds: 1));
    return productList;
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    await Future.delayed(Duration(seconds: 1));
    return popularList;
  }

  @override
  Future<List<ProductModel>> getRecommended() async {
    await Future.delayed(Duration(seconds: 1));
    return recommendedList;
  }

}

  