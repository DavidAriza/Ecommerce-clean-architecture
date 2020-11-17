import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://www.iconsdb.com/icons/preview/soylent-red/sad-xxl.png',
            height: 90,
          ),
          Text(
            'Your cart is empty',
            textAlign: TextAlign.center,
          ),
          Center(
            child: RaisedButton(
              color: AppColors.purple,
              textColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              onPressed: (){},
              child: Text(
                'Go home'
              ),
              
            ),
          )
        ],
      );
  }
}