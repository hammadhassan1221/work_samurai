import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class ScheduleComponents {
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

  _alertDialogueContainer({@required BuildContext context,@required ScheduleProviders scheduleProviders}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            padding: EdgeInsets.only(
                left: AppSizes.width * 0.03, right: AppSizes.width * 0.03),
            height: AppSizes.height,
            child: Column(
              children: [
                CommonWidgets.getScheduleRow("Monday", scheduleProviders),
                CommonWidgets.getAvailability(
                    text: "10:00 am",
                    onPress: () {
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now());
                    }),
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
                      DatePicker.showTime12hPicker(context,
                          showTitleActions: true, onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now());
                    }),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Container(
                  height: AppSizes.height * 0.0025,
                  decoration: BoxDecoration(
                      color: AppColors.clr_field,
                      borderRadius: BorderRadius.circular(3)),
                ),
                CommonWidgets.getSignUpButton(
                    context: context,
                    onPress: () {
                      hideLoader(context);
                    },
                    text: "Save Availability")
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
      @required ScheduleProviders scheduleProviders
      }) {
    return GestureDetector(
      onTap: () {
        _alertDialogueContainer(context: buildContext, scheduleProviders: scheduleProviders);
      },
      child: Container(
        height: AppSizes.height * 0.08,
        margin: EdgeInsets.only(
          left: AppSizes.width * 0.04,
          right: AppSizes.width * 0.04,
        ),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.clr_white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ]),
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
