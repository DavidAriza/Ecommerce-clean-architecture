
import 'package:clean_architecture_getx/domain/entities/login_request.dart';
import 'package:clean_architecture_getx/domain/entities/login_response.dart';
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

abstract class ApiRepository {

  Future<UserEntity> getUserFromToken(String token);

  Future<LoginResponse> login(LoginRequest login);

  Future<void> logout(String token);

}