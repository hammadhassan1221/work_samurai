import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class SettingsComponents {
  Widget getUserImage({@required Function onPress,@required IconData iconData,@required String imagePath}) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle),

            child: Image.asset(imagePath,height: 150,width: 150,fit: BoxFit.fill,),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            top: AppSizes.height*0.22,
            child: Icon(iconData,),
          )
        ],
      ),
    );
  }
  Widget getInputContainer({@required String heading , @required IconData iconData,@required Function onPress}){
     return GestureDetector(
      onTap: onPress,
      child: Container(
        height: AppSizes.height*0.08,
        width: AppSizes.width,
        padding: EdgeInsets.only(left: AppSizes.width*0.025,right: AppSizes.width*0.03,),
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03),
        decoration: BoxDecoration(
          color: AppColors.clr_field,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(heading,style: TextStyle(
            fontFamily: 'MuliRegular',
            fontSize: 16
          ),),
          Icon(iconData),
        ],),
      ),

    );
 }

  Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,top: AppSizes.height*0.03),
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
                fontSize: 16.0,
                fontFamily: 'MuliRegular',
                color: AppColors.clr_white),
          ),
        ),
      ),
    );
  }


}
