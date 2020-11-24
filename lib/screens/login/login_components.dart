import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';



class LoginComponents {
  Widget getImageContainer(String imagePath, double height, double width) {
    return Container(
        child: Image.asset(imagePath, width: width, height: height,));
  }

  Widget getRichText1(
      {@required String text1,
        @required String text2,
        @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          alignment: Alignment.bottomCenter,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.clr_bg_black,
                  fontFamily: 'MuliRegular',
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.02,
              ),
              Text(
                text2,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.clr_bg_black,
                  fontFamily: 'MuliRegular',
                ),
              )
            ],
          )),
    );
  }

  Widget getRichText(
      {@required String text1,
        @required String text2,
        @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          alignment: Alignment.bottomCenter,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.clr_bg_black,
                  fontFamily: 'MuliRegular',
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.clr_red))
                ),
                child: Text(
                  text2,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.clr_red,
                    fontFamily: 'MuliRegular',

                  ),
                ),
              )
            ],
          )),
    );
  }


}
