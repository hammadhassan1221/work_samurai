import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';


class SignUpComponents{
  Widget getImageContainer(String imagePath, double height, double width) {
    return Container(
        child: Image.asset(imagePath, width: width, height: height));
  }

  Widget getButton(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        width: AppSizes.width * 0.8,
        height: AppSizes.height * 0.07,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: AppSizes.height * 0.02,
          left: AppSizes.width * 0.08,
          right: AppSizes.width * 0.08,
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
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            color: textColor,
            fontFamily: 'MuliRegular',
          ),
        ),
      ),
    );
  }

  Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required String imagePath,
        @required TextEditingController controller,
        @required bool isPassword,
      }) {
    return Container(
        width: AppSizes.width*0.8,
        height: AppSizes.height*0.075,
        alignment: Alignment.bottomCenter,
        padding:EdgeInsets.only(left: AppSizes.width*0.025),
        margin: EdgeInsets.only(top:AppSizes.height*0.02,left:AppSizes.height*0.03,right:AppSizes.height*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
          cursorHeight: 12,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(fontSize: 12,
                color: AppColors.clr_bg_black2,
                fontFamily: 'MuliRegular',),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding:EdgeInsets.all(AppSizes.width*0.03),
                child: Image.asset(imagePath,height: 25,width :25),
              )

          ),
        )
    );
  }

  Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return GestureDetector(
      onTap: onPress,
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
    );
  }

}