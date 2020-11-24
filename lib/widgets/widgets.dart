import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_provider.dart';

class CommonWidgets {
  static Widget getRow(String text, bool value, Function onPress) {
    return Container(
        margin: EdgeInsets.only(top: AppSizes.height * 0.01),
        padding: EdgeInsets.only(
          left: AppSizes.width * 0.03,
          right: AppSizes.width * 0.03,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 15,
                  fontFamily: 'MuliRegular'),
            ),
            CupertinoSwitch(
                activeColor: Colors.lightGreenAccent,
                value: value,
                onChanged: onPress),
          ],
        ));
  }

  static Widget getScheduleRow(
      String text, ScheduleProviders scheduleProviders) {
    return Container(
        margin: EdgeInsets.only(
            top: AppSizes.height * 0.01, bottom: AppSizes.height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 20,
                  fontFamily: 'MuliBold'),
            ),
            Row(
              children: [
                Text(
                  "All Day",
                  style: TextStyle(fontFamily: 'MuliRegular', fontSize: 14),
                ),
                CupertinoSwitch(
                  value: scheduleProviders.value,
                  onChanged: (value){
                    scheduleProviders.setToggleButton(value);
                  }

                ),
              ],
            ),
          ],
        ));
  }

  static Widget getAvailability(
      {@required String text, @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.05,
                width: AppSizes.width * 0.03,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.clr_green,
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Text(
                "Available From",
                style: TextStyle(
                    fontFamily: 'MuliRegular',
                    color: AppColors.clr_green,
                    fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.clr_green,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
        ],
      ),
    );
  }

  static Widget getAvailability2(
      {@required String text1,
      @required String text,
      @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.05,
                width: AppSizes.width * 0.03,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.clr_bg_black,
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Text(
                text1,
                style: TextStyle(
                    color: AppColors.clr_bg_black,
                    fontSize: 16,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.clr_bg_black,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
        ],
      ),
    );
  }

 static Widget getSignUpButton({@required BuildContext context, @required Function onPress,@required String text}) {
   return Align(
     alignment: Alignment.bottomCenter,
     child: GestureDetector(
       onTap: onPress,
       child: Container(
         margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,top: AppSizes.height*0.03,bottom: AppSizes.height*0.05,),
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
             decoration: TextDecoration.none,
               fontSize: 16.0,
               fontFamily: 'MuliRegular',
               color: AppColors.clr_white),
         ),
       ),
     ),
   );
 }


  static   Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required String imagePath,
        @required TextEditingController controller,
        @required bool isPassword,
      }) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding:EdgeInsets.only(left: AppSizes.width*0.025),
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.height*0.03,right:AppSizes.height*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
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

   static Widget getAppBar({@required String text , @required BuildContext context}) {

    return Container(
      height: AppSizes.height * 0.09,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.clr_white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSizes.width * 0.035 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap:(){
                Navigator.pop(context);
              },
              child: Image.asset(Assets.barArrow,height: 20,width: 20,)),

          SizedBox(
            width: AppSizes.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.clr_bg_black,
                decoration: TextDecoration.none,
                fontSize: 22,
                fontFamily: 'MuliSemiBold'),
          )
        ],
      ),
    );

  }

  static Widget getAppBarWithout({
    @required String text,
  }) {
    return Container(
      height: AppSizes.height * 0.09,

      decoration: BoxDecoration(
        color: AppColors.clr_white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSizes.width * 0.038),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 22,
                fontFamily: 'MuliBold'),
          )
        ],
      ),
    );
  }

  static Widget getSupportContainer(
      {@required String imagePath,
      @required String heading,
      @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
            left: AppSizes.width * 0.03, right: AppSizes.width * 0.03),
        height: AppSizes.height * 0.12,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 0.8,
                blurRadius: 0.5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          color: AppColors.clr_bg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.clr_bg_grey,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                ),
                SizedBox(
                  width: AppSizes.width * 0.03,
                ),
                Text(
                  heading,
                  style: TextStyle(
                    color: AppColors.clr_bg_black,
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontFamily: 'MuliBold',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
