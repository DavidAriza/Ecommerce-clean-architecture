
import 'package:clean_architecture_getx/data/datasource/local_storage_data_source.dart';
import 'package:clean_architecture_getx/data/repositories/local_storage_repository.dart';
import 'package:clean_architecture_getx/domain/usecases/user_usecase.dart';
import 'package:clean_architecture_getx/global/routes/routes.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {

  final controller = Get.find<HomeController>();

  Future<void>logOut() async {
    controller.logOut();
    Get.offAllNamed(AppRoutes.login);
  }

  void updateTheme(bool isDark) {
    controller.onChangeTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme );
  } 

  @override
  Widget build(BuildContext context) {
    return Obx(
      () { 
      final user = controller.user.value;
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(  
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height:30),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.green
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: user.image == null 
                            ? SizedBox.shrink()        
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(user.image),
                            ),
                        ),
                      ),
                      SizedBox(height:20),
                      Text(
                        user.name == null ? 'user.name' : user.name,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold) ,
                      )
                    ],              
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Personal information',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Username',
                                ),
                                Text(
                                  user.username == null ? 'user.username' : user.username,
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Theme.of(context).secondaryHeaderColor),
                                ),
                                Obx(
                                  () => SwitchListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      'Dark mode',
                                      style: Theme.of(context).textTheme.bodyText1
                                    ),
                                    value: controller.isDark.value,
                                    onChanged: updateTheme
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: RaisedButton(
                          color: AppColors.purple,
                          textColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          onPressed: logOut,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Log Out'
                            ),
                          ),
  
                        ),
                      ),
                    ],
                  )
                )
              ],
            )
          
      );}
    );
  }
}