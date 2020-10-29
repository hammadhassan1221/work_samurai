import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/Business/home/pages/book/book.dart';
import 'package:work_samurai/screens/business/application/application.dart';
import 'package:work_samurai/screens/business/home/home.dart';
import 'package:work_samurai/screens/signup/sign_up.dart';
import 'package:work_samurai/screens/worker/worker.dart';

class LoginComponents {
  Widget getImageContainer(String imagePath, double height, double width) {
    return Container(
        child: Image.asset(imagePath, width: width, height: height));
  }

  Widget getRichText(
      {@required String text1,
      @required String text2,
      @required BuildContext context}) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: AppSizes.height * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.clr_bg_black,
                fontFamily: 'MultiRegular',
              ),
            ),
            SizedBox(
              width: AppSizes.width * 0.02,
            ),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.clr_red,
                fontFamily: 'MultiRegular',
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ));
  }

  Widget getLoginButton(@required String imagePath, @required String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(
          color: AppColors.clr_bg_grey,
        ),
        color: AppColors.transparentColor,
      ),
      child: FlatButton(
        color: AppColors.transparentColor,
        textColor: AppColors.clr_bg_black,
        padding: EdgeInsets.all(8.0),
        onPressed: () {},
        child: Row(
          children: [
            getImageContainer(imagePath, 28, 28),
            SizedBox(
              width: AppSizes.width * 0.10,
            ),
            Container(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: Assets.muliRegular,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSignUpButton(BuildContext context, Function onPress) {
    return Positioned(
      top: AppSizes.height * 0.55,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, SlideRightRoute(page: Home()));
        },
        child: GestureDetector(
          onTap: () =>onPress(),
          child: Container(
            margin: EdgeInsets.only(left: AppSizes.width * 0.05),
            alignment: Alignment.center,
            height: AppSizes.height * 0.08,
            width: AppSizes.width / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5,
              ),
              border: Border.all(
                color: AppColors.clr_bg_black,
              ),
              color: AppColors.clr_bg_black,
            ),
            child: Text(
              "Login with email",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: Assets.muliRegular,
                  color: AppColors.clr_white),
            ),
          ),
        ),
      ),
    );
  }
}
