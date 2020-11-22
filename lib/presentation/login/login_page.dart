import 'package:clean_architecture_getx/global/routes/routes.dart';
import 'package:clean_architecture_getx/global/theme/theme.dart';
import 'package:clean_architecture_getx/presentation/login/login_controller.dart';
import 'package:clean_architecture_getx/presentation/login/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<LoginController> {


  void login() async {
    final result = await controller.login();
    if(result){
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: _buildBody(context, size),
      )),
    );
  }

  Widget _buildBody(BuildContext context, Size size) {
    final double h = 10.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _halfCircleAndLogo(size, context),
            SizedBox(height: h,),
            Center(
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: h*2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Username',
                style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).inputDecorationTheme.labelStyle.color),
                textAlign: TextAlign.left,
              ),
            ),
            _buildTextField(controller.usernameTextController, false, context, 'username', Icons.person_outline),
            SizedBox(height: h+5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Password',
                style: Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).inputDecorationTheme.labelStyle.color),
                textAlign: TextAlign.left,
              ),
            ),
            _buildTextField(controller.passwordTextController, true, context, '* * * * * *', Icons.lock),
            SizedBox(height: size.height*0.2,),
            Center(
              child: GradientButton(
                context: context,
                width: size.width*0.6,
                onTap: login , 
                text: 'Login',
              ),
            ),
          ],
        ),
        Obx((){
          if(controller.loginState.value == LoginState.loading){
            return Container(
              color: Colors.black26,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return SizedBox.shrink();
          } 
        }
        )
      ],
    );
  }

  Widget _halfCircleAndLogo(Size size, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter ,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 50),
          height: size.height*0.25 ,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(200))
          ),
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).canvasColor,
          child: Icon(Icons.person, size: 80, color: Theme.of(context).iconTheme.color),
          radius: 50,
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController textController, bool value,  BuildContext context, String text, IconData icon){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: textController,
        obscureText: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Theme.of(context).iconTheme.color,),
          hintText: text
        ),
      ),
    );
  }
}



