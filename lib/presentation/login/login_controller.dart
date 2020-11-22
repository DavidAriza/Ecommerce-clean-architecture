import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:clean_architecture_getx/domain/usecases/login_usecase.dart';
import 'package:clean_architecture_getx/domain/usecases/user_usecase.dart';
import 'package:clean_architecture_getx/domain/entities/login_request.dart';


enum LoginState {
  initial,
  loading
}

class LoginController extends GetxController{


  final UserUseCases userUseCases;
  final LoginUseCase loginUseCase;

  LoginController({this.userUseCases, this.loginUseCase});

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var loginState = LoginState.initial.obs;

  Future<bool> login()async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;
    loginState(LoginState.loading);
    try {
      final loginResponse = await loginUseCase.login(
        LoginRequest(username, password)
      );
      await userUseCases.saveToken(loginResponse.token);
      await userUseCases.saveUser(loginResponse.user);
      
      return true;
    } catch (e) {
      print(e);
      loginState(LoginState.initial);
      return false;
    }
  }
}