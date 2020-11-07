import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class ScheduleComponents {

  Widget getLocationDistance({@required String imagePath, @required String text,@required String text1,}) {
    return Container(
      margin: EdgeInsets.only(
        left: AppSizes.width * 0.04,
        right: AppSizes.width * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 25,
                width: 25,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: AppSizes.width * 0.02,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'MuliRegular',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'MuliRegular',
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getDayTime({@required String day,@required String time}){
    return GestureDetector(
      onTap:(){
     //   _alertDialogueContainer();
      },
      child: Container(
        height: AppSizes.height * 0.08,
        margin: EdgeInsets.only(left: AppSizes.width*0.04,right:  AppSizes.width*0.04,),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
            Border.all(color: AppColors.clr_bg_grey),
            color: AppColors.clr_white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'MuliSemiBold',

              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'MuliRegular',
              ),
            )
          ],
        ),
      ),
    );
  }
}
