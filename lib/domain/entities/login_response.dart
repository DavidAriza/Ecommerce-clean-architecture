
import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

class LoginResponse {
  
  final String token;
  final UserEntity user;

  LoginResponse(this.token, this.user);

}