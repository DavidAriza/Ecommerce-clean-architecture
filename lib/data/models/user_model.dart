

import 'package:clean_architecture_getx/domain/entities/user_entity.dart';

class UserModel extends UserEntity{

  UserModel({
    String name,
    String username,
    String email,
    String image
  }) : super(username: username, name: name, image: image, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        image: json["image"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "image": image,
    };

}