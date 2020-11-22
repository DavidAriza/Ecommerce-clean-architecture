import 'package:clean_architecture_getx/presentation/home/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/home/home_controller.dart';
class CustomNavigationBar extends StatelessWidget {

  final int index;
  final ValueChanged<int> onIndexSelected;
  final controller = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  CustomNavigationBar({Key key, this.index, this.onIndexSelected, }) : super(key: key);

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
            GestureDetector(
              child: Icon(
                Icons.home,
                color: index == 0 ? AppColors.green : AppColors.lightGrey,
              ),
              onTap: () => onIndexSelected(0)
            ),
            GestureDetector(
              child: Icon(
                Icons.store,
                color: index == 1 ? AppColors.green : AppColors.lightGrey,
              ),
              onTap: () => onIndexSelected(1)
            ),
            Stack(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: AppColors.purple,
                    child: Icon(
                      Icons.shopping_basket,
                      color: index == 2 ? AppColors.green : AppColors.lightGrey,         
                    )
                  ),
                  onTap: () => onIndexSelected(2)
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                  () => cartController.totalItems.value == 0 
                    ? SizedBox.shrink() 
                    : CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '${cartController.totalItems.value}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      )
                  ))
              ],
            ),
            GestureDetector(
              child: Icon(
                Icons.favorite_border_outlined,
                color: index == 3 ? AppColors.green : AppColors.lightGrey,
              ),
              onTap: () => onIndexSelected(3)
            ),
            InkWell(
              onTap: () => onIndexSelected(4),
              child: Obx((){
                final user = controller.user.value;
                return user.image == null 
                  ? SizedBox.shrink()
                  : CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.purple,
                      backgroundImage: NetworkImage(user.image),
                  );
                  
              }),
            )
            // InkWell(
            //   onTap: () => onIndexSelected(4),
            //   child:CircleAvatar(
            //           radius: 15,
            //           backgroundColor: AppColors.purple,
            //       )
                  
            //   ,
            // )
          ],
        ),
      ),
    );
  }
}