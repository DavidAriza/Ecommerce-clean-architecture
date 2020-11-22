
import 'package:clean_architecture_getx/data/models/user_model.dart';
import 'package:clean_architecture_getx/domain/entities/login_request.dart';
import 'package:clean_architecture_getx/domain/entities/login_response.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

abstract class ApiDataSource {

  Future<UserEntity> getUserFromToken(String token);

  Future<LoginResponse> login(LoginRequest login);

  Future<void> logout(String token);

}

class ApiDataSourceImpl implements ApiDataSource{
  @override
  Future<UserModel> getUserFromToken(String token) async {
    await Future.delayed(Duration(seconds: 3));
      if(token == 'AA111') {
        return UserModel(
          name: 'Mugiwara D. Luffy',
          username: 'luffy',
          image: 'https://image.winudf.com/v2/image/Y29tLkdoYW54aXMuTW9ua2V5REx1ZmZ5V2FsbHBhcGVySERfc2NyZWVuXzJfMTUyMzg4NTIzNF8wNDg/screen-2.jpg?fakeurl=1&type=.jpg'
        );
      } else if(token == 'AA222') {
        return UserModel(
          name: 'Roronoa Zoro',
          username: 'zoro',
          image: 'https://pm1.narvii.com/6401/dc3b69e6e2f7f57391a85bf88a6e192dc2f761cf_hq.jpg'
        );
      } 
      throw Exception( 'error' );
    }
  
    @override
    Future<LoginResponse> login(LoginRequest login) async {
      await Future.delayed(Duration(seconds: 3));
      if(login.username == 'luffy' && login.pasword == 'luffy') {
        return LoginResponse(
          'AA111',
          UserModel(
            name: 'Mugiwara D. Luffy',
            username: 'luffy',
            image: 'https://image.winudf.com/v2/image/Y29tLkdoYW54aXMuTW9ua2V5REx1ZmZ5V2FsbHBhcGVySERfc2NyZWVuXzJfMTUyMzg4NTIzNF8wNDg/screen-2.jpg?fakeurl=1&type=.jpg'
          )
        );
      } else if(login.username == 'zoro' && login.pasword == 'zoro') {
        return LoginResponse(
          'AA222',
          UserModel(
            name: 'Roronoa Zoro',
            username: 'zoro',
            image: 'https://pm1.narvii.com/6401/dc3b69e6e2f7f57391a85bf88a6e192dc2f761cf_hq.jpg'
          )
        );
      } 
      throw Exception( 'error' );
    }
  
    @override
    Future<void> logout(String token) async {
    print('removing token from server');
    return;
  }



}