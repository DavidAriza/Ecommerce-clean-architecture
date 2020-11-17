import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    @required this.context,
    @required this.width, this.onTap, this.text,
  }) : super(key: key);

  final BuildContext context;
  final double width;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          )
        ),
        child: Text(
          text,
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}