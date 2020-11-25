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
            top: AppSizes.height*0.1,
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
            boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.25),
        spreadRadius: 1.5,
        blurRadius: 2,
        offset: Offset(0, 0), // changes position of shadow
      ),],
          color: AppColors.clr_bg,
          border: Border.all(color: AppColors.clr_bg_grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(heading,style: TextStyle(
            fontFamily: 'MuliRegular',
            fontSize: 16
          ),),
          Icon(iconData,color: AppColors.clr_bg_black2,),
        ],),
      ),

    );
 }

}
