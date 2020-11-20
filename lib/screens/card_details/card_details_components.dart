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
          color: AppColors.clr_field,
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

  Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return GestureDetector(
      onTap: onPress,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(left:AppSizes.height*0.03,right:AppSizes.height*0.03,bottom: AppSizes.height*0.05),
          alignment: Alignment.center,
          height: AppSizes.height * 0.08,
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
      ),
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