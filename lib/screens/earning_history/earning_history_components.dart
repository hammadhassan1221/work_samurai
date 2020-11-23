

import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class EarningHistoryComponents{
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
              color: AppColors.clr_bg_black,
                decoration: TextDecoration.none,
                fontSize: 22,
                fontFamily: 'MulisSemiBold'),
          )
        ],
      ),
    );

  }
  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left: AppSizes.width*0.03),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              decoration:TextDecoration.none,
              color: AppColors.clr_bg_black,
              fontFamily: 'MulisSemiBold',
            )
        )
    );
  }
  Widget getSubHeading({@required String text}){
    return Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        child:Text(
          text,
            textAlign: TextAlign.justify,
            style:TextStyle(
              decoration:TextDecoration.none,
              fontSize: 15,
              color: AppColors.clr_bg_black2,
              fontFamily: 'MuliRegular',
            ),

          ),

    );
  }
  Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,top: AppSizes.height*0.03,bottom: AppSizes.height*0.05,),
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
                decoration: TextDecoration.none,
                  fontSize: 16.0,
                  fontFamily: 'MuliRegular',
                  color: AppColors.clr_white),
            ),
          ),
        ),
      ),
    );
  }

}