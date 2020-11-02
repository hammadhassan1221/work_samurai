import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class CardComponents{
  Widget getHeading({@required String text}){

    return Container(
      margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03),
      height: AppSizes.height*0.08,
      width: AppSizes.width,
      padding: EdgeInsets.all(12),
      child: Text(text,style: TextStyle(
        color: AppColors.clr_bg_black,
          fontFamily: 'MuliBold',
        fontSize: 18
      ),),
    );

  }

  Widget getSubHeading({@required String text}){

    return Container(
      margin: EdgeInsets.only(left: AppSizes.width*0.05,right: AppSizes.width*0.05,),
      height: AppSizes.height*0.04,
      width: AppSizes.width,
      padding: EdgeInsets.only(left:AppSizes.width*0.015),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.sign_field))
      ),
      child: Text(text,style: TextStyle(
          color: AppColors.clr_bg_black2,
          fontFamily: 'MuliBold',
          fontSize: 14
      ),),
    );

  }

  Widget getAppBar({@required String text , @required BuildContext context}) {

    return Container(
      height: AppSizes.height * 0.09,
      width: AppSizes.width,
      color: AppColors.clr_white,
      padding: EdgeInsets.all(AppSizes.width * 0.042),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap:(){
                Navigator.pop(context);
              },
              child: Image.asset(Assets.barArrow,height: 20,width: 20,)),

          SizedBox(
            width: AppSizes.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 22,
                fontFamily: 'MuliBold'),
          )
        ],
      ),
    );

  }
}