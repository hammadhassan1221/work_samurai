import 'package:bouncing_widget/bouncing_widget.dart';
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
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/widgets/widgets.dart';

import '../../res/sizes.dart';
import 'login_providers.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool onCheck = false;

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  LoginComponents _loginComponents;
  LoginProvider _loginProvider;
  TextEditingController _email, _password;
  AnimationController _animationController;
  double _scale;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _loginComponents = LoginComponents();
    _loginProvider = Provider.of<LoginProvider>(context, listen: false);
    _loginProvider = LoginProvider();
    _email = TextEditingController();
    _password = TextEditingController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _tapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animationController.value;
    Provider.of<LoginProvider>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Center(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Column(

              children: [
                _loginComponents.getImageContainer(Assets.logo, 270, 270),
                CommonWidgets.getInputField(
                  backgroundColor: AppColors.transparentColor,
                  borderColor: AppColors.clr_bg_grey,
                  textColor: AppColors.clr_bg_black2,
                  text: "Username",
                  isPassword: false,
                  controller: _email,
                  imagePath: Assets.mail,
                ),
                SizedBox(
                  height: 10,
                ),
                CommonWidgets.getInputField(
                  backgroundColor: AppColors.transparentColor,
                  borderColor: AppColors.clr_bg_grey,
                  textColor: AppColors.clr_bg_black2,
                  text: "Password",
                  controller: _password,
                  isPassword: true,
                  imagePath: Assets.lock,
                ),
                Container(
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
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: TextStyle(
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                              fontSize: 13),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Remember Me',
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                fontSize: 14,
                                fontFamily: Assets.muliRegular,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                CommonWidgets.getBottomButton(
                  name: "Login",
                  onButtonClick: () {
                    _loginProvider.callLoginAPI(
                      context: context,
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    );
                  },
                ),
                verticalSpacer(
                  10.0,
                ),
                _loginComponents.getRichText1(
                  text1: "Forgot Password?",
                  text2: "",
                  onPress: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        page: ForgetPassword(),
                      ),
                    );
                  },
                ),
                verticalSpacer(
                  77.5,
                ),
                BouncingWidget(
                  duration: Duration(milliseconds: 200),
                  scaleFactor: 1,
                  child: _loginComponents.getRichText(
                    text1: "Don't have an account?",
                    text2: "Sign Up",
                    onPress: () {
                      Navigator.push(context, SlideRightRoute(page: SignUp()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
