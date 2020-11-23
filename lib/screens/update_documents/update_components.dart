import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class UpdateComponents{
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
  Widget getSubHeadings(){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left: AppSizes.width*0.03),
        child: Text(
            "There are many variations of passages of Lore Ipsu available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slight believable.",
            style: TextStyle(
                fontSize: 15,
                color: AppColors.clr_bg_black,
                fontFamily: 'MuliRegular',
                letterSpacing: 1
            )
        )
    );
  }
}