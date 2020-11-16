import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class CommonWidgets{

  static Widget getRow(String text, bool value, Function onPress){

    return Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.01),

        height: AppSizes.height*0.09,
        width: AppSizes.width,

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
          text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 15,
                  fontFamily: 'MuliRegular'),),
            CupertinoSwitch(
              activeColor: AppColors.clr_green,
              value:value,
              onChanged: onPress),

          ],
        )
    );
  }

  static Widget getAvailability(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.height*0.05,
              width: AppSizes.width*0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.clr_green,
              ),
            ),
            SizedBox(width: AppSizes.width*0.03,),
            Text("Available From",
              style: TextStyle(
                  color: AppColors.clr_green,
                  fontSize: 16),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("10:00am",style: TextStyle(fontSize: 16,color: AppColors.clr_green),)],
        ),
      ],
    );
  }

  static Widget getAvailability2(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.height*0.05,
              width: AppSizes.width*0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.clr_bg_black,
              ),
            ),
            SizedBox(width: AppSizes.width*0.03,),
            Text(text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 16),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("5:00pm",style: TextStyle(fontSize: 16,color: AppColors.clr_bg_black),)],
        ),
      ],
    );
  }

  static Widget getButton(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        width: AppSizes.width,
        height: AppSizes.height * 0.07,
        margin: EdgeInsets.only(left:AppSizes.height*0.015,right:AppSizes.height*0.015,),

        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6,
          ),
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.w500,
            fontFamily: Assets.muliRegular
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress}) {
    return Container(
      width: AppSizes.width * 0.8,
      height: AppSizes.height * 0.07,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: AppSizes.height * 0.02,
        left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: borderColor,
        ),
        color: backgroundColor,
      ),
      padding: EdgeInsets.all(10),
      child: TextField(

        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
            ),
            border: InputBorder.none,
            hintText: "Email",
            hintStyle: TextStyle(
              fontSize: 15,

              decoration: TextDecoration.none,
            )),
      ),
    );
  }

  static Widget getAppBar({@required String text,@required Function onPress,@required String imagepath}){
    return Container(
      height: AppSizes.height * 0.09,
      color: AppColors.clr_white,
      padding: EdgeInsets.all(AppSizes.width*0.038),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: onPress,
              child: Image.asset(imagepath,height: 20,width: 20,)),
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

  static Widget getAppBarWithout({@required String text,}){
    return Container(
      height: AppSizes.height * 0.09,
      color: AppColors.clr_white,
      padding: EdgeInsets.all(AppSizes.width*0.038),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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

  static Widget getSupportContainer({@required String imagePath,@required String heading,@required Function onPress}){
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03),
        height: AppSizes.height * 0.1,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.clr_bg_grey,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: 45,
                  height: 45,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: AppSizes.width * 0.03,
                ),
                Text(
                  heading,
                  style: TextStyle(
                    color: AppColors.clr_bg_black,
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontFamily: 'MuliBold',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios,size: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}