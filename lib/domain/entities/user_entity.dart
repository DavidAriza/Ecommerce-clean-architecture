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

  @override
  List<Object> get props => [name, username, email, image];
}