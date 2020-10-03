import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class LoginComponents{

  Widget getImageContainer(String imagePath, double height ,double width){
    return  Container(
        child: Image.asset(imagePath, width:width,  height: height)
    );
  }

  Widget getRichText({@required String text1, @required String text2}){
    return Container(
        width: AppSizes.width * 0.85,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.clr_bg_black,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: text2,
                  style: TextStyle(
                      color: AppColors.clr_red,
                    decoration: TextDecoration.underline,),
              )],
          ),
        ));
  }

  Widget getLoginButton(@required String imagePath){
    return Container(
      height: AppSizes.height*0.08,
      width: AppSizes.width*0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(color: AppColors.clr_bg_grey,),
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
              width: AppSizes.width*0.05,
            ),
            Container(
              child: Text(
                "Sign up with Google",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getSignUpButton(){
    return Container(
      height: AppSizes.height*0.08,
      width: AppSizes.width*0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        border: Border.all(color: AppColors.clr_bg_black,),
        color: AppColors.clr_bg_black,
      ),
      child: FlatButton(
        color: AppColors.clr_bg_black,
        textColor: Colors.white,
        padding: EdgeInsets.all(8.0),
        onPressed: () {},
        child: Text(
          "Login with email",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}