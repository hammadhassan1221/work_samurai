import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class ForgetPasswordComponents{
  Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required String imagePath,
        @required TextEditingController controller,
      }) {
    return Container(
        width: AppSizes.width,
        height: AppSizes.height*0.075,
        alignment: Alignment.bottomCenter,

        margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05,top: AppSizes.height*0.03),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
          controller: controller,
          //cursorHeight: 12,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(fontSize: 12,
                color: AppColors.clr_bg_black2,
                fontFamily: 'MuliRegular',),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding:EdgeInsets.all(AppSizes.width*0.03),
                child: Image.asset(imagePath,height: 25,width :25),
              )

          ),
        )
    );
  }

  Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05,top: AppSizes.height*0.03),
        alignment: Alignment.center,
        height: AppSizes.height * 0.08,
        width: AppSizes.width,
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
          text,
          style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'MuliRegular',
              color: AppColors.clr_white),
        ),
      ),
    );
  }


}