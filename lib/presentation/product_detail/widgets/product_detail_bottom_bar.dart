import 'package:clean_architecture_getx/presentation/login/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

Widget productDetailBottomBar(BuildContext context, Size size, num price) {
  return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    GradientButton(
      context: context,
      width: size.width*0.6,
      text: 'Ordenar ahora',
      onTap: () {},
    ),
    Text(
      '\$$price',
      //style: Theme.of(context).textTheme.headline6,
    )
  ],
    );
  }