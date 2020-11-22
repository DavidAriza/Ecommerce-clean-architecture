import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
    
  final String name;
  final String username;
  final String email;
  final String image;
  
  UserEntity({
        this.name,
        this.username,
        this.email,
        this.image,
    });

  factory UserEntity.empty() => UserEntity(
    name: null,
    username : null,
    image: null, 
    //email: null
  );

  @override
  List<Object> get props => [name, username, email, image];
}