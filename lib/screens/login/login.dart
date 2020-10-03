import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/login/login_components.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginComponents _loginComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginComponents = LoginComponents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
            children: [
              _loginComponents.getImageContainer(Assets.logo, 400, 400),
              _loginComponents.getSignUpButton(),
              SizedBox(
                height: AppSizes.height*0.02,
              ),
              _loginComponents.getLoginButton(Assets.google_login, "Sign up with Google"),
              SizedBox(
                height: AppSizes.height*0.02,
              ),
              _loginComponents.getLoginButton(Assets.facebook_login, "Sign up with Facebook"),
              SizedBox(
                height: AppSizes.height*0.02,
              ),
              _loginComponents.getRichText(text1: "Don't have an account?", text2: "Sign Up"),
            ],
          ),
      )
    );
  }
}
