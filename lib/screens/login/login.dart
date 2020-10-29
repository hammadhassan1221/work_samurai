import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/login/login_components.dart';
import 'package:work_samurai/screens/worker/worker.dart';

import '../../res/sizes.dart';
import 'login_providers.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginComponents _loginComponents;
  LoginProvider _loginProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginComponents = LoginComponents();
    _loginProvider = LoginProvider();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Stack(
            children: [
              _loginComponents.getImageContainer(Assets.logo, 400, 400),
              _loginComponents.getSignUpButton(context, (){
                _loginProvider.login(context: context, email: "", password: "");
              }),

              Positioned(
                top: AppSizes.height*0.45,
                child: Container(
                  height:AppSizes.height*0.1,
                  width: AppSizes.width,
                  child: TextField(
                  decoration: InputDecoration(
                  ),
                ),),
              ),

              SizedBox(height: AppSizes.height*0.02,),

              Positioned(
                top: AppSizes.height*0.40,
                child: Container(
                  height:AppSizes.height*0.1,
                  width: AppSizes.width,
                  child: TextField(
                    decoration: InputDecoration(
                    ),
                  ),),
              ),
              _loginComponents.getRichText(text1: "Don't have an account?", text2: "Sign Up"),
            ],
          ),
      )
    );
  }
}
