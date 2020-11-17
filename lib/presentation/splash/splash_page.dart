import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
                Icons.food_bank,
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
