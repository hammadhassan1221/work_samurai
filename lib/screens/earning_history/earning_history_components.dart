

import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class EarningHistoryComponents{
  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left: AppSizes.width*0.03),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              decoration:TextDecoration.none,
              color: AppColors.clr_bg_black,
              fontFamily: 'MuliRegular',
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
              fontWeight: FontWeight.w400,
              color: AppColors.clr_bg_black2,
              fontFamily: 'MuliRegular',
            ),

          ),

    );
  }
}