

import 'package:clean_architecture_getx/domain/entities/login_request.dart';
import 'package:clean_architecture_getx/domain/entities/login_response.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';
import 'package:clean_architecture_getx/domain/repositories/api_repository.dart';

class LoginUseCase {

  final ApiRepository apiRepository;

  LoginUseCase({this.apiRepository});

  
  Future<UserEntity> getUserFromToken(String token) async {
    return await apiRepository.getUserFromToken(token);    
  }
  
    
  Future<LoginResponse> login(LoginRequest login) async {
    return await apiRepository.login(login);
  }
  
    
  Future<void> logout(String token) async {
  return await apiRepository.logout(token);
  }

}