import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/spacer.dart';

class InProgressComponents {
  int minutes = 0;

  Widget inProgressContainer({
    @required BuildContext context,
    @required String jobTitle,
    @required String dateTime,
    @required String location,
    @required String totalAmount,
    @required String amountHour,
    @required double timer,
    @required Function requestBreak,
    @required Function endShift,
    @required int startTime,
    @required Function onTimeFinish,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(
          12.0,
        ),
      ),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.clr_field,
              ),
              color: AppColors.clr_white,
            ),
            child: Column(
              children: [
                verticalSpacer(8.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(
                      8.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$jobTitle',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "MuliSemiBold",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      Text(
                        '\$' + '$totalAmount',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "MuliSemiBold",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(4.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(
                      8.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$dateTime',
                        style: TextStyle(
                          fontSize: AppSizes.fontRatio * 12,
                          fontFamily: "MuliRegular",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      Text(
                        '\$' + '$amountHour' + '/h',
                        style: TextStyle(
                          fontSize: AppSizes.fontRatio * 12,
                          fontFamily: "MuliRegular",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(24.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(
                      8.0,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$location',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "MuliRegular",
                      color: AppColors.clr_bg_black,
                    ),
                  ),
                ),
                verticalSpacer(8.0),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.clr_field,
                ),
                verticalSpacer(8.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(
                      8.0,
                    ),
                    vertical: verticalValue(
                      8.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      checkContainer(),
                      horizontalSpacer(
                        8.0,
                      ),
                      Text(
                        'Check-in time',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "MuliRegular",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      horizontalSpacer(
                        120.0,
                      ),
                      Text(
                        '10:22am',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "MuliRegular",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacer(8.0),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.clr_field,
                ),
                verticalSpacer(
                  16.0,
                ),
                Countdown(
                  seconds: startTime,
                  build: (BuildContext context, startTime) => Center(
                    child: Text(
                      "${startTime.round().toInt()}" + "   Minutes Left",
                      style: TextStyle(
                        color: AppColors.clr_bg_black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  interval: Duration(microseconds: 23,),
                  onFinished: onTimeFinish,
                ),
                verticalSpacer(
                  16.0,
                ),
              ],
            ),
          ),
          verticalSpacer(
            16.0,
          ),
          requestBreakButton(
            requestBreak: requestBreak,
          ),
          verticalSpacer(
            16.0,
          ),
          endShiftButton(
            endShift: endShift,
          ),
        ],
      ),
    );
  }

  Widget checkContainer() {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: AppColors.clr_green.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget requestBreakButton({Function requestBreak}) {
    return FlatButton(
      color: AppColors.transparentColor,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
        side: BorderSide.merge(
          BorderSide(
            color: AppColors.clr_bg_black.withOpacity(0.8),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          BorderSide(
            color: AppColors.clr_bg_black.withOpacity(0.8),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
      ),
      splashColor: AppColors.clr_bg_black.withOpacity(0.2),
      highlightColor: AppColors.clr_bg_black.withOpacity(0.1),
      onPressed: requestBreak,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(
            18.0,
          ),
          vertical: verticalValue(
            18.0,
          ),
        ),
        child: Text(
          'Request Break',
          style: TextStyle(
            fontSize: AppSizes.fontRatio * 16,
            fontFamily: "MuliRegular",
            color: AppColors.clr_bg_black,
          ),
        ),
      ),
    );
  }

  Widget endShiftButton({Function endShift}) {
    return FlatButton(
      color: AppColors.clr_bg_black,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
        side: BorderSide.merge(
          BorderSide(
            color: AppColors.clr_bg_black.withOpacity(0.8),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          BorderSide(
            color: AppColors.clr_bg_black.withOpacity(0.8),
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
      ),
      splashColor: AppColors.clr_red.withOpacity(0.4),
      highlightColor: AppColors.clr_red.withOpacity(0.2),
      onPressed: endShift,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue(
            18.0,
          ),
          vertical: verticalValue(
            18.0,
          ),
        ),
        child: Text(
          'End Shift',
          style: TextStyle(
            fontSize: AppSizes.fontRatio * 16,
            fontFamily: "MuliRegular",
            color: AppColors.clr_white,
          ),
        ),
      ),
    );
  }

  requestBreakContainer({BuildContext context, Function requestBreak}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(AppSizes.height * 0.03),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Break Duration",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'MuliSemiBold',
                        decoration: TextDecoration.none,
                        color: AppColors.clr_bg_black),
                  ),
                  Text(
                    "15 mins",
                    style: TextStyle(
                        fontFamily: 'MuliSemiBold',
                        decoration: TextDecoration.none,
                        color: AppColors.clr_bg_black2),
                  )
                ],
              ),
              SizedBox(
                height: AppSizes.height * 0.075,
              ),
              Container(
                height: AppSizes.height * 0.2,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (dateTime) {
                    minutes = dateTime.minute;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: verticalValue(
                    48.0,
                  ),
                ),
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  disabledColor: AppColors.clr_bg_black,
                  color: AppColors.clr_bg_black,
                  splashColor: AppColors.clr_red.withOpacity(0.4),
                  focusColor: AppColors.clr_red.withOpacity(0.2),
                  onPressed: () => requestBreak(this.minutes),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    child: Text(
                      "Request Break",
                      style: TextStyle(
                        color: AppColors.clr_white,
                        fontSize: 16,
                        fontFamily: 'MuliRegular',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
