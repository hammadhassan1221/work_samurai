import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class BackgroundCheckComponents{

  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,right: AppSizes.width*0.03,left: AppSizes.width*0.03),
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


  Widget getBackgroundDetails(){
    return Container(
      margin: EdgeInsets.only(top:AppSizes.height*0.015,right: AppSizes.width*0.03,left: AppSizes.width*0.03),

      child: Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore etdolore magna aliqua. Ut enim ad minim veniam,quisnostrud exercitation ullamco laboris nisi ut aliquip exea commodoconsequat. Duis aute irure dolor inreprehenderit in voluptate velit essecillum dolore eufugiat nulla pariatur. Excepteur sint occaecatcupidatat nonproident, sunt in culpa qui officiadeserunt mollit anim id est laborum.",
          style:TextStyle(fontFamily: 'MuliRegular',fontSize: 14)),
    );
  }

  Widget getExistingButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        splashColor: AppColors.clr_white,
        child: Container(
          margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,bottom:AppSizes.height*0.025 ),
          alignment: Alignment.center,
          height: AppSizes.height * 0.08,
          width: AppSizes.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
            border: Border.all(
              color: AppColors.transparentColor,
            ),
            color: AppColors.sign_field,
          ),
          child: SizedBox.expand(
            child: FlatButton(
              onPressed: onPress,
              child: Text(
                text,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'MuliRegular',
                    color: AppColors.clr_bg_black),

              ),),
          ),
        ),
      ),
    );
  }
}