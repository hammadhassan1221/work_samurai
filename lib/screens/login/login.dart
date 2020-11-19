import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/forget_password/forget_password.dart';
import 'package:work_samurai/screens/login/login_components.dart';
import 'package:work_samurai/screens/sign_up/sign_up.dart';
import 'package:work_samurai/widgets/toast.dart';

import '../../res/sizes.dart';
import 'login_providers.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginComponents _loginComponents;
  LoginProvider _loginProvider;
  TextEditingController _email, _password;
  FocusNode _focusNode;
  bool onCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginComponents = LoginComponents();
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    _loginProvider = LoginProvider();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _loginComponents.getImageContainer(Assets.logo, 300, 300),
                _loginComponents.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.clr_bg_grey,
                    textColor: AppColors.clr_bg_black2,
                    text: "Email",
                    controller: _email,
                    imagePath: Assets.mail),
                SizedBox(
                  height: AppSizes.height * 0.02,
                ),
                _loginComponents.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.clr_bg_grey,
                    textColor: AppColors.clr_bg_black2,
                    text: "Password",
                    controller: _password,
                    imagePath: Assets.lock),
                Container(
                    margin: EdgeInsets.only(
                      left: AppSizes.height * 0.01,
                      right: AppSizes.height * 0.03,
                    ),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: AppColors.clr_white,
                          activeColor: AppColors.clr_bg_black,
                          value: onCheck,
                          onChanged: (bool value) {
                            setState(() {
                              onCheck = value;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                        )
                      ],
                    )),
                SizedBox(
                  height: AppSizes.height * 0.02,
                ),
                _loginComponents.getSignUpButton(
                    context: context,
                    onPress: () {
                      _loginProvider.callLoginAPI(
                          context: context,
                          email: _email.text.toString(),
                          password: _password.text.toString());
                    },
                    text: "Login"),
                SizedBox(
                  height: AppSizes.height * 0.02,
                ),
                _loginComponents.getRichText(
                    text1: "",
                    text2: "Forget Password?",
                    onPress: () {
                      Navigator.push(
                          context, SlideRightRoute(page: ForgetPassword()));
                    }),
                SizedBox(
                  height: AppSizes.height * 0.06,
                ),
              RichText(
                text: TextSpan(
                    text: 'Dont have an account?',
                    style: TextStyle(
                        fontFamily: 'MuliRegular',
                        color: AppColors.clr_bg_black,
                        fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: AppColors.clr_red,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            fontFamily: 'MuliRegular',
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, SlideRightRoute(page: SignUp()));
                            })
                    ]),
              )
              ],
            ),
          ),
        ));
  }
}
