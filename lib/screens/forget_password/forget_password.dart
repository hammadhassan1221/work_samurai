import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/sign_up/sign_up.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'forget_password_components.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgetPasswordComponents _forgetPasswordComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _forgetPasswordComponents = ForgetPasswordComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_field,
        child: Column(
          children: [
            CommonWidgets.getAppBarWithout(text: "Forget Password"),

            Container(
              margin: EdgeInsets.only(top: AppSizes.height*0.15),
              padding: EdgeInsets.only(left: AppSizes.width*0.038),
              width: AppSizes.width,
              child:Text("Confirm your email and we'll send you the information",
                style: TextStyle(
                fontFamily: 'MuliRegular',
                  fontSize: 14,
                  letterSpacing: 0.1

              ),),
            ),

            _forgetPasswordComponents.getInputField(backgroundColor: AppColors.clr_field, borderColor: AppColors.clr_bg_grey, textColor: AppColors.clr_bg_black2, text: "Email", imagePath: Assets.mail),

            _forgetPasswordComponents.getSignUpButton(context: context, onPress: (){Navigator.push(context, SlideRightRoute(page: SignUp()));}, text: "Reset my Password")
          ],
        ),
      ),
    ));
  }
}
