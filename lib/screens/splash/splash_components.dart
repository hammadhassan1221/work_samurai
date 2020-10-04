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
}