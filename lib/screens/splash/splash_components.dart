import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class SplashComponents{

  Widget getMainContainer(String imagePath, double height ,double width){
    return  Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child:  Center(
          child: Image.asset(imagePath, width:width,  height: height)
      ),
    );
  }

  Widget getVersionText({String versionNumber}) {
    var white;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.width * 0.04),
        child: Text(
          "Version : " + versionNumber,
          style: TextStyle(
            color: AppColors.clr_white,
          ),
        ),
      ),
    );
  }

}