import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class PasswordComponents{
  Widget getHeading({@required String text}){
    return Container(
      margin: EdgeInsets.only(top:AppSizes.height*0.02,bottom:AppSizes.height*0.01,left: AppSizes.width*0.03,right: AppSizes.width*0.03),
      child: Text(text,style: TextStyle(
          color: AppColors.clr_bg_black,
          fontFamily: 'MuliSemiBold',
          fontSize: 18
      ),),
    );

  }

  Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required TextEditingController controller,
        @required bool isPassword,
      }) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(fontSize: 15,
              color: AppColors.clr_bg_black2,
              fontFamily: 'MuliRegular',),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(12),

          ),
        )
    );
  }
}