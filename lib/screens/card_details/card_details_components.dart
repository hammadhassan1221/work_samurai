import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class CardComponents{
  Widget getHeading({@required String text}){
    return Container(
      margin: EdgeInsets.only(top:AppSizes.height*0.02,bottom:AppSizes.height*0.01,left: AppSizes.width*0.03,right: AppSizes.width*0.03),
      child: Text(text,style: TextStyle(
          color: AppColors.clr_bg_black,
          fontFamily: 'MuliBold',
          fontSize: 18
      ),),
    );

  }

  Widget getSubHeading({@required String text}){

    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(left: AppSizes.width*0.03),
        margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.clr_bg_grey,
          ),
          borderRadius: BorderRadius.circular(5),
          color: AppColors.clr_bg,
        ),

        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(fontSize: 12,
              color: AppColors.clr_bg_black2,
              fontFamily: 'MuliRegular',),
            border: InputBorder.none,


          ),
        )
    );


  }
}