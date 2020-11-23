import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';



class LoginComponents {
  Widget getImageContainer(String imagePath, double height, double width) {
    return Container(
        child: Image.asset(imagePath, width: width, height: height,));
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
              Text(
                text2,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.clr_bg_black,
                  fontFamily: 'MuliRegular',
                ),
              )
            ],
          )),
    );
  }

  Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left:AppSizes.height*0.03,right:AppSizes.height*0.03,),
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

  Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required String imagePath,
        @required TextEditingController controller,
      }) {
    return Container(
        width: AppSizes.width,
        height: AppSizes.height*0.075,
        alignment: Alignment.bottomCenter,

        margin: EdgeInsets.only(left:AppSizes.height*0.03,right:AppSizes.height*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
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
}
