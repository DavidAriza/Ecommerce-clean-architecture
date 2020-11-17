import 'package:clean_architecture_getx/global/routes/routes.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/home/home_page.dart';
import 'package:clean_architecture_getx/presentation/login/login_page.dart';
import 'package:clean_architecture_getx/presentation/products/product_page.dart';
//import 'package:clean_architecture_getx/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,

    );
  }
}
