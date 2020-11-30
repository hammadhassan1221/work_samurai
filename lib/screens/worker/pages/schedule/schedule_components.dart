import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class ScheduleComponents {
   bool onClick = false;
  Widget getDistance({
    @required String imagePath,
    @required String text,
    @required String text1,
  }) {
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
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.clr_bg_black))),
            child: Text(
              text1,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'MuliRegular',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getLocation({
    @required String imagePath,
    @required String text,
    @required String text1,
  }) {
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _alertDialogueContainer(
      {@required BuildContext context,
      @required ScheduleProviders scheduleProviders}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            padding: EdgeInsets.only(
                left: AppSizes.width * 0.03, right: AppSizes.width * 0.03),
            height: AppSizes.height,
            child: Column(
              children: [
            Container(
            margin: EdgeInsets.only(
            top: AppSizes.height * 0.01, bottom: AppSizes.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Monday",
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
                          value: onClick,
                          onChanged: (bool value){
                            onClick = !onClick;
                          }

                      ),
                    ],
                  ),
                ],
              )),
                CommonWidgets.getAvailability(text1: "Available From", text: "10:00 am", onPress: (){}),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Container(
                  height: AppSizes.height * 0.0025,
                  decoration: BoxDecoration(
                      color: AppColors.clr_field,
                      borderRadius: BorderRadius.circular(3)),
                ),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                CommonWidgets.getAvailability2(
                    text1: "Available to",
                    text: "5:00 pm",
                    onPress: () {

                    }),
                SizedBox(
                  height: AppSizes.height * 0.035,
                ),

                Container(
                  height: AppSizes.height*0.15,
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (dateTime) {
                      }
                  ),
                ),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Container(
                  height: AppSizes.height * 0.0025,
                  decoration: BoxDecoration(
                      color: AppColors.clr_field,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Expanded(
                  child: CommonWidgets.getSignUpButton(
                      context: context,
                      onPress: () {
                        hideLoader(context);
                      },
                      text: "Save Availability"),
                )
              ],
            ),
          );
        });
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget getDayTime(
      {@required BuildContext buildContext,
      @required String day,
      @required String time,
      @required ScheduleProviders scheduleProviders}) {
    return GestureDetector(
      onTap: () {
        _alertDialogueContainer(
            context: buildContext, scheduleProviders: scheduleProviders);
      },
      child: Container(
        height: AppSizes.height * 0.08,
        margin: EdgeInsets.only(
          left: AppSizes.width * 0.04,
          right: AppSizes.width * 0.04,
        ),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 1.5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(8), color: AppColors.clr_white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MuliSemiBold',
                  color: AppColors.clr_bg_black),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.clr_bg_black,
                fontFamily: 'MuliRegular',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getWedThur({@required String day, @required String time}) {
    return GestureDetector(
      onTap: () {
        // _alertDialogueContainer();
      },
      child: Container(
        height: AppSizes.height * 0.08,
        margin: EdgeInsets.only(
          left: AppSizes.width * 0.04,
          right: AppSizes.width * 0.04,
        ),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.clr_white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MuliSemiBold',
                  color: AppColors.clr_field),
            ),
            Text(
              time,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MuliRegular',
                  color: AppColors.clr_field),
            )
          ],
        ),
      ),
    );
  }


}
