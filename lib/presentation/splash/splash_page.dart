import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.person,
                size: 80,
              )
            ),
            Text(
              'Delivery App',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.green, AppColors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
