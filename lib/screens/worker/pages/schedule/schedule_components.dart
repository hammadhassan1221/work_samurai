import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_provider.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'package:intl/intl.dart';

class ScheduleComponents {
  bool onClick = false;
  String fromDate = "09:00 AM";
  String toDate = "05:00 PM";
  static Map<String, dynamic> scheduleMap = Map<String, dynamic>();


  bool isFromDateSelected = true;

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
          Text(
            text1,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'MuliRegular',
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
    @required onPress,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
                  border: Border(
                      bottom: BorderSide(color: AppColors.clr_bg_black))),
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
      ),
    );
  }

  _alertDialogueContainer(
      {@required BuildContext context,
      @required ScheduleProviders scheduleProviders,
      @required String day}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.only(
                    left: AppSizes.width * 0.03, right: AppSizes.width * 0.03),
                height: AppSizes.height,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: AppSizes.height * 0.01,
                            bottom: AppSizes.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              day,
                              style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  fontSize: 20,
                                  fontFamily: 'MuliBold'),
                            ),
                            Row(
                              children: [
                                Text(
                                  "All Day",
                                  style: TextStyle(
                                      fontFamily: 'MuliRegular', fontSize: 14),
                                ),
                                CupertinoSwitch(
                                    value: onClick,
                                    onChanged: (bool value) {
                                      setState(() {
                                        onClick = !onClick;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        )),
                    isFromDateSelected
                        ? CommonWidgets.getAvailability(
                            text1: "Available From",
                            text: fromDate,
                            onPress: () {
                              isFromDateSelected = true;
                            })
                        : CommonWidgets.getAvailability2(
                            text1: "Available From",
                            text: fromDate,
                            onPress: () {
                              setState(() {
                                isFromDateSelected = true;
                              });
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
                    isFromDateSelected
                        ? CommonWidgets.getAvailability2(
                            text1: "Available to",
                            //isChecked: !isFromDateSelected,
                            text: toDate,
                            onPress: () {
                              setState(() {
                                isFromDateSelected = false;
                              });
                            })
                        : CommonWidgets.getAvailability(
                            text1: "Available to",
                            //isChecked: !isFromDateSelected,
                            text: toDate,
                            onPress: () {
                              isFromDateSelected = false;
                            }),
                    SizedBox(
                      height: AppSizes.height * 0.035,
                    ),
                    Container(
                      height: AppSizes.height * 0.15,
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (dateTime) {
                            final DateFormat formatter = DateFormat('hh:mm aa');
                            final String selectedTime =
                                formatter.format(dateTime);
                            setState(() {
                              if (isFromDateSelected) {
                                fromDate = selectedTime;
                              } else
                                toDate = selectedTime;
                            });
                          }),
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
                    CommonWidgets.getBottomButton(
                        onButtonClick: (() {
                          // ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "null");

                          String dayfrom = day+"From";
                          String dayto = day+"To";
                          scheduleMap[dayfrom] = fromDate;
                          scheduleMap[dayto] = toDate;
                          Navigator.pop(context);
                          // ApplicationToast.getSuccessToast(durationTime: 3, heading: "null", subHeading: scheduleMap.toString());
                        }),
                        name: "DONE")
                  ],
                ),
              );
            },
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
            context: buildContext, scheduleProviders: scheduleProviders,day: day);
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
            offset: Offset(0, 0), // changes position of shadow
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
              ("${scheduleMap["${day}From"]} - ${scheduleMap["${day}To"]}") == "null - null" ?time :("${scheduleMap["${day}From"]} - ${scheduleMap["${day}To"]}"),
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

  // Widget getWedThur({@required String day, @required String time}) {
  //   return GestureDetector(
  //     onTap: () {
  //       // _alertDialogueContainer();
  //     },
  //     child: Container(
  //       height: AppSizes.height * 0.08,
  //       margin: EdgeInsets.only(
  //         left: AppSizes.width * 0.04,
  //         right: AppSizes.width * 0.04,
  //       ),
  //       padding: EdgeInsets.all(10.0),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8), color: AppColors.clr_white),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             day,
  //             style: TextStyle(
  //                 fontSize: 18,
  //                 fontFamily: 'MuliSemiBold',
  //                 color: AppColors.clr_field),
  //           ),
  //           Text(
  //             time,
  //             style: TextStyle(
  //                 fontSize: 18,
  //                 fontFamily: 'MuliRegular',
  //                 color: AppColors.clr_field),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
