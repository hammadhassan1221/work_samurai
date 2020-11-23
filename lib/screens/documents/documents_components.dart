import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class DocumentComponents{

  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left: AppSizes.width*0.03),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.clr_bg_black,
              fontFamily: 'MuliBold',
            )
        )
    );
  }

  Widget getUserInfo({@required Function onPress,@required String text,@required String text1,@required IconData iconData, @required Color colors}){
    return GestureDetector(
      onTap:onPress,
      child: Container(
        height: AppSizes.height*0.1,
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03,top: AppSizes.height*0.02),
        width: AppSizes.width,
        padding: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03),
        decoration: BoxDecoration(
          color: AppColors.clr_white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.transparentColor),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black
                  ),),
                Text(
                  text,
                  style: TextStyle(
                  fontSize: 15,
                    fontFamily: 'MuliRegular',
                    color: AppColors.clr_bg_black
                ),),
              ],
            ),

            Icon(iconData,color: colors,),
          ],
        ),
      ),
    );
  }
}