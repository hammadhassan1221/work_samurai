import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile.dart';
import 'package:work_samurai/screens/worker/pages/account/account.dart';
import 'package:work_samurai/widgets/MapView.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

class GigsComponents {
  String getTime(String dateTime) {
    if (dateTime != null) {
      List<String> temp = dateTime.split(" ");
      return temp[1] + temp[2];
    } else {
      return "10:30 PM";
    }
  }

  Widget getOffersContainer({
    @required BuildContext context,
    @required String jobTitle,
    @required String dateTime,
    @required String location,
    @required String totalAmount,
    @required String amountHour,
  }) {}

  Widget getInProgressContainer(
      {@required BuildContext context,
        @required String jobTitle,
        @required String dateTime,
        @required String location,
        @required String totalAmount,
        @required String amountHour}) {
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
                        jobTitle,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "MuliSemiBold",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      Text(
                        '\$' + '$totalAmount',
                        style: TextStyle(
                          fontSize: 22,
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
                          fontSize: AppSizes.fontRatio * 16,
                          fontFamily: "MuliRegular",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      Text(
                        '\$' + '$amountHour' + '/h',
                        style: TextStyle(
                          fontSize: AppSizes.fontRatio * 16,
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
                      fontSize: 16,
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
                          fontSize: 16,
                          fontFamily: "MuliRegular",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      horizontalSpacer(
                        140.0,
                      ),
                      Text(
                        '10:22am',
                        style: TextStyle(
                          fontSize: 16,
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
                Center(
                  child: Text(
                    '04 : 22 : 53',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "MuliBold",
                      color: AppColors.clr_bg_black,
                    ),
                  ),
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
          requestBreakButton(),
          verticalSpacer(
            16.0,
          ),
          endShiftButton(),
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

  Widget requestBreakButton() {
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
      onPressed: () {},
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

  Widget endShiftButton() {
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
      onPressed: () {},
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

  Widget getConfirmedContainer(
      {@required BuildContext context,
        @required String jobTitle,
        @required String dateTime,
        @required String location,
        @required String totalAmount,
        @required onLeave(),
        @required onReject(),
        @required onStart(),
        @required bool leftForJob,
        @required String amountHour}) {
    return Container(
      height: AppSizes.height *.3,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(
          15.0,
        ),
      ),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.clr_field),
              color: AppColors.clr_white,
            ),
            child: Column(
              children: [
                verticalSpacer(5.0),
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
                        jobTitle,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "MuliSemiBold",
                          color: AppColors.clr_bg_black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: AppColors.clr_bg_black2,
                      ),
                    ],
                  ),
                ),
                verticalSpacer(8.0),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(
                      8.0,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$dateTime',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "MuliRegular",
                      color: AppColors.clr_bg_black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue(
                      8.0,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                      5.0,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    '\$' + '$amountHour' + '/h',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "MuliRegular",
                      color: AppColors.clr_bg_black,
                    ),
                  ),
                ),
                verticalSpacer(0.0),
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
                      fontSize: 16,
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
                Container(
                  height: AppSizes.heightRatio * 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getCancelActionButton(
                        context: context,
                        buttonColor: AppColors.clr_red,
                        icon: Icons.close,
                        onPress: () {onReject();},
                        name: "Cancel Gig",
                      ),
                      Container(
                        height: double.infinity,
                        width: 1,
                        color: AppColors.clr_field,
                      ),
                      leftForJob?
                      getStartActionButton(
                        context: context,
                        buttonColor: AppColors.clr_bg_black,
                        icon: Entypo.arrows_ccw,
                        onPress: (){onStart();},
                        name: "Start",
                      )
                          :
                      getStartActionButton(
                        context: context,
                        buttonColor: AppColors.clr_bg_black,
                        icon: Entypo.flag,
                        onPress: (){onLeave();},
                        name: "Leave",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCancelActionButton(
      {Color buttonColor,
        BuildContext context,
        IconData icon,
        Function onPress,
        String name}) {
    return Expanded(
      child: Container(
        height: double.infinity,
        child: FlatButton(
          splashColor: buttonColor.withOpacity(0.2),
          highlightColor: buttonColor.withOpacity(0.1),
          onPressed: () {onPress.call();},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: buttonColor,
              ),
              Text(
                '$name',
                style: TextStyle(
                  fontSize: AppSizes.fontRatio * 14,
                  fontFamily: "MuliRegular",
                  color: buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getStartActionButton(
      {Color buttonColor,
        BuildContext context,
        IconData icon,
        Function onPress,
        String name}) {
    return Expanded(
      child: Container(
        height: double.infinity,
        child: FlatButton(
          splashColor: buttonColor.withOpacity(0.2),
          highlightColor: buttonColor.withOpacity(0.1),
          onPressed: (){
            onPress();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: buttonColor,
              ),
              Text(
                '$name',
                style: TextStyle(
                  fontSize: AppSizes.fontRatio * 14,
                  fontFamily: "MuliRegular",
                  color: buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  newTaskModalBottomSheet(context,
  {@required String jobTitle,@required double lat,@required double long,@required double rating,@required String date, @required String time,@required String pay,@required String contactPerson,@required String place,@required String instructions}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.only(
                  left: AppSizes.width * 0.015, right: AppSizes.width * 0.015),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )),
              child: ListView(
                children: [
                  Container(
                      width: AppSizes.width * 0.08,
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(jobTitle,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'MuliBold',
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(place,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.clr_bg_black,
                                                  fontFamily: 'MuliBold',
                                                )),
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.015,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(2.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                  border: Border.all(
                                                    color: AppColors.clr_bg_grey,
                                                  )),
                                              child: Row(
                                                children: [
                                                  Image.asset(Assets.star,
                                                      width: 10, height: 10),
                                                  Text(rating.toString(),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                        Assets.muliRegular,
                                                        color:
                                                        AppColors.clr_bg_black,
                                                      ))
                                                ],
                                              )),
                                        ],
                                      )
                                    ],
                                  )),
                              Container(
                                child: Image.asset(
                                  Assets.support,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Date",
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
                                      date,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Time",
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
                                      time,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Pay",
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
                                      pay,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.contacts,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Contact Person",
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
                                      contactPerson,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Place",
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
                                      place,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Divider(),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            height: AppSizes.height * 0.4,
                            width: AppSizes.width,
                            child:
                            MapView(startLat: lat,
                                startLong: lat,
                                apiKey: null,
                                directionsApiKey: "AIzaSyBxBzba_srvA-PJBBF2JEaqswGUibpzeNQ"),
                            // Image.asset(
                            //   Assets.google,
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          Divider(),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Instructions",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'MuliBold',
                                  color: AppColors.clr_bg_black,
                                ),
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                instructions,//"Wear white shirt with black pants and black shoes.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.clr_bg_black,
                                  fontFamily: 'MuliRegular',
                                ),
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          // Container(
                          //     decoration: BoxDecoration(
                          //       border: Border.all(
                          //         color: AppColors.clr_field,
                          //       ),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Container(
                          //             height: AppSizes.height * 0.06,
                          //             decoration: BoxDecoration(
                          //               border: Border(
                          //                 right: BorderSide(
                          //                     width: 2.0,
                          //                     color: AppColors.clr_field),
                          //               ),
                          //               color: Colors.white,
                          //             ),
                          //             padding:
                          //             EdgeInsets.all(AppSizes.width * 0.02),
                          //             width: AppSizes.width * 0.44,
                          //             child: Row(
                          //               mainAxisAlignment:
                          //               MainAxisAlignment.center,
                          //               children: [
                          //                 Image.asset(
                          //                   Assets.cancelgig,
                          //                   height: 20,
                          //                   width: 20,
                          //                   color: AppColors.clr_bg_black,
                          //                 ),
                          //                 SizedBox(
                          //                   width: AppSizes.width * 0.01,
                          //                 ),
                          //                 Text("Skip",
                          //                     style: TextStyle(
                          //                       fontSize: 14,
                          //                       fontFamily: 'MuliRegular',
                          //                       color: AppColors.clr_bg_black,
                          //                     )),
                          //               ],
                          //             )),
                          //         Container(
                          //             height: AppSizes.height * 0.06,
                          //             padding:
                          //             EdgeInsets.all(AppSizes.width * 0.02),
                          //             decoration: BoxDecoration(
                          //                 color: AppColors.clr_white),
                          //             width: AppSizes.width * 0.44,
                          //             child: Row(
                          //               mainAxisAlignment:
                          //               MainAxisAlignment.center,
                          //               children: [
                          //                 Icon(
                          //                   Icons.check,
                          //                   color: AppColors.clr_green,
                          //                   size: 18,
                          //                 ),
                          //                 SizedBox(
                          //                   width: AppSizes.width * 0.01,
                          //                 ),
                          //                 Text("Accept",
                          //                     style: TextStyle(
                          //                       fontSize: 14,
                          //                       color: AppColors.clr_green,
                          //                     )),
                          //               ],
                          //             )),
                          //       ],
                          //     )),
                        ],
                      ))
                ],
              ));
        });
  }

  _container() {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: AppSizes.width * 0.05),
        child: Text(
          "Apply",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'MuliBold',
            color: AppColors.clr_bg_black,
          ),
        ));
  }

  _requestBreakContainer({context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(AppSizes.height * 0.03),
          child: Column(
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
                    onDateTimeChanged: (dateTime) {}),
              ),
              Expanded(
                child: CommonWidgets.getBottomButton(
                    onButtonClick: () {}, name: "Request Break"),
              )
            ],
          ),
        );
      },
    );
  }

  Widget isAccountVerified({BuildContext context}) {
    if (PreferenceUtils.getBool(Strings.IS_ACCOUNT_VERIFIED)) {
      return SizedBox.shrink();
    } else {
        return CommonWidgets.getAlertContainer(

        onPress: () => Navigator.push(
          context,
          SlideRightRoute(
            page: Account(),
          ),
        ),
      );
    }

  }
}
