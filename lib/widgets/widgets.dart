import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class CommonWidgets{
  static Widget getRow(String text, bool value, Function onPress){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     Text(text,
       style: TextStyle(
           fontSize: 15,
           fontFamily: Assets.muliRegular,
           color:Colors.black,
       ),),

     Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
         Container(
           width: AppSizes.width*0.11,
           height: AppSizes.height*0.03,
           margin: EdgeInsets.all(12),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: AppColors.clr_bg_grey
           ),
           child: Stack(
             children: [
               Align(
                 alignment:Alignment.centerLeft,
                 child: Container(
                   height: AppSizes.height*0.03,
                   width: AppSizes.width*0.04,
                   margin: EdgeInsets.only(left:AppSizes.width*0.01,right: AppSizes.width*0.01),
                   decoration: BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle
                   ),
                 ),
               )
             ],
           ),
         ),
       ],
     )
      ],
    );
  }

  static Widget getAvailability(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.height*0.05,
              width: AppSizes.width*0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.clr_green,
              ),
            ),
            SizedBox(width: AppSizes.width*0.03,),
            Text("Available From",
              style: TextStyle(
                  color: AppColors.clr_green,
                  fontSize: 16),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("10:00am",style: TextStyle(fontSize: 16,color: AppColors.clr_green),)],
        ),
      ],
    );
  }

  static Widget getAvailability2(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.height*0.05,
              width: AppSizes.width*0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.clr_bg_black,
              ),
            ),
            SizedBox(width: AppSizes.width*0.03,),
            Text(text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 16),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("5:00pm",style: TextStyle(fontSize: 16,color: AppColors.clr_bg_black),)],
        ),
      ],
    );
  }

  static Widget getButton(
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
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress}) {
    return Container(
      width: AppSizes.width * 0.8,
      height: AppSizes.height * 0.07,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: AppSizes.height * 0.02,
        left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
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
      padding: EdgeInsets.all(10),
      child: TextField(

        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
            ),
            border: InputBorder.none,
            hintText: "Email",
            hintStyle: TextStyle(
              fontSize: 15,

              decoration: TextDecoration.none,
            )),
      ),
    );
  }

  static Widget getUserField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress,
        @required TextEditingController controller,
      }) {
    return Container(
      width: AppSizes.width * 0.8,
      height: AppSizes.height * 0.07,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: AppSizes.height * 0.02,
        left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
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
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,

        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,

            ),
            border: InputBorder.none,
            hintText: "Username",
            hintStyle: TextStyle(
              fontSize: 15,
              decoration: TextDecoration.none,
            )),
      ),
    );
  }

  static Widget getPasswordField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress}) {
    return Container(
      width: AppSizes.width * 0.8,
      height: AppSizes.height * 0.07,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: AppSizes.height * 0.02,
        left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
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
      padding: EdgeInsets.all(10),
      child: TextField(

        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,

            ),
            suffixIcon: Icon(
              Icons.visibility,

            ),
            border: InputBorder.none,
            hintText: "Password",
            hintStyle: TextStyle(
              fontSize: 15,

              decoration: TextDecoration.none,
            )),
      ),
    );
  }

  static Widget getAccount(
      {@required BuildContext context,
        @required String text,
        @required Function onPress}) {
    return Container(
      margin: EdgeInsets.only(
        top: AppSizes.height * 0.02,
        left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
      ),
      child: GestureDetector(
        onTap: () => onPress(),
        child: Text(
          text,
          style: TextStyle(),
        ),
      ),
      /*  GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )*/
    );
  }

}