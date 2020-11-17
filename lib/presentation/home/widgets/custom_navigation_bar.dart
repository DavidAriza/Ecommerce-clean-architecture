import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';

class CustomNavigationBar extends StatelessWidget {

  final int index;
  final ValueChanged<int> onIndexSelected;

  const CustomNavigationBar({Key key, this.index, this.onIndexSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).selectedRowColor
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: index == 0 ? AppColors.green : AppColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(0)
              ),
            ),
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.store,
                  color: index == 1 ? AppColors.green : AppColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(1)
              ),
            ),
            Material(
              child: CircleAvatar(
                radius: 23,
                backgroundColor: AppColors.purple,
                child: IconButton(
                  icon: Icon(
                  Icons.shopping_basket,
                  color: index == 2 ? AppColors.green : AppColors.lightGrey,
                ),
                  onPressed: () => onIndexSelected(2)
                ),
              ),
            ),
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: index == 3 ? AppColors.green : AppColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(3)
              ),
            ),
            InkWell(
              onTap: () => onIndexSelected(4),
              child: CircleAvatar(
                radius: 15,
                
                backgroundImage: AssetImage('assets/burger.jpg')
              ),
            )
          ],
        ),
      ),
    );
  }
}