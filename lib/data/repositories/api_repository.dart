

import 'package:clean_architecture_getx/data/datasource/api_data_source.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/entities/login_response.dart';
import 'package:clean_architecture_getx/domain/entities/login_request.dart';
import 'package:clean_architecture_getx/domain/repositories/api_repository.dart';
import 'package:clean_architecture_getx/presentation/login/login_page.dart';

class ApiRepositoryImpl implements ApiRepository{

  final ApiDataSource apiDataSource;

  ApiRepositoryImpl({this.apiDataSource});

  @override
  Future<UserEntity> getUserFromToken(String token) async {
    return await apiDataSource.getUserFromToken(token);    
  }
  
    @override
    Future<LoginResponse> login(LoginRequest login) async {
      return await apiDataSource.login(login);
    }
  
    @override
    Future<void> logout(String token) async {
    return await apiDataSource.logout(token);
  }

}