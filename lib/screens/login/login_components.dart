import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class LoginComponents {
  Widget getImageContainer(String imagePath, double height, double width) {
    return Container(
        child: Image.asset(imagePath, width: width, height: height));
  }

  Widget getRichText({@required String text1, @required String text2}) {
    return Container(
        width: AppSizes.width * 0.85,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.clr_bg_black,
              fontFamily: Assets.muliRegular,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.clr_red,
                  fontFamily: Assets.muliRegular,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ));
  }

  Widget getLoginButton(@required String imagePath, @required String text) {
    return Container(
      height: AppSizes.height * 0.08,
      width: AppSizes.width * 0.85,
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
            getImageContainer(imagePath, 50, 50),
            SizedBox(
              width: AppSizes.width * 0.05,
            ),
            Container(
              child: Text(
                text,
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

  Widget getSignUpButton() {
    return Container(
      height: AppSizes.height * 0.08,
      width: AppSizes.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(
          color: AppColors.clr_bg_black,
        ),
        color: AppColors.clr_bg_black,
      ),
      child: FlatButton(
        color: AppColors.clr_bg_black,
        textColor: Colors.white,
        onPressed: () {},
        child: Text(
          "Login with email",
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: Assets.muliRegular,
          ),
        ),
      ),
    );
  }
}
