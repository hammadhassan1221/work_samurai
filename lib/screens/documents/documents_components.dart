import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

/*
  Widget getUserInfo2({@required Function onPress,@required String text,@required IconData iconData, @required Color colors}){
    return GestureDetector(
      onTap:onPress,
      child: Container(
        height: AppSizes.height*0.1,
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03,top: AppSizes.height*0.02),
        width: AppSizes.width,
        padding: EdgeInsets.all(AppSizes.width*0.03),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: AppColors.clr_white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.transparentColor),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'MuliRegular',
                  color: AppColors.clr_bg_black
              ),),

            Icon(iconData,color: colors,),
          ],
        ),
      ),
    );
  }
*/

  Widget getUserInfo({@required Function onPress,@required String text,@required String text1,@required IconData iconData, @required Color colors}){
    return GestureDetector(
      onTap:onPress,
      child: Container(
        height: AppSizes.height*0.1,
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03,),
        width: AppSizes.width,
        padding: EdgeInsets.all(AppSizes.width*0.03),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
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
                      fontSize: 14,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_green
                  ),),

                Text(
                  text,
                  style: TextStyle(
                  fontSize: 18,
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

  Widget getUserInfo2({@required Function onPress,@required String text,@required String text1,}){
    return GestureDetector(
      onTap:onPress,
      child: Container(
        height: AppSizes.height*0.1,
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03,),
        width: AppSizes.width,
        padding: EdgeInsets.all(AppSizes.width*0.03),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
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
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MuliRegular',
                      color: Colors.deepOrangeAccent
                  ),),

                Text(
                  text1,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black
                  ),),

              ],
            ),

         //   Icon(iconData,color: colors,),

          ],
        ),
      ),
    );
  }

}