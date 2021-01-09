import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/spacer.dart';
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

  String _getTotalAmount(double valueA, double valueB) =>
      (valueA * valueB).toString();

  Widget getOffersContainer({
    @required BuildContext context,
    @required String jobTitle,
    @required String dateTime,
    @required String location,
    @required String totalAmount,
    @required String amountHour,
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
                  alignment: Alignment.centerRight,
                  child: Text(
                    '\$' + '$amountHour' + '/h',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "MuliRegular",
                      color: AppColors.clr_bg_black,
                    ),
                  ),
                ),
                verticalSpacer(4.0),
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
                        buttonColor: AppColors.clr_bg_black,
                        icon: Icons.close,
                        onPress: () {},
                        name: "Skip",
                      ),
                      Container(
                        height: double.infinity,
                        width: 1,
                        color: AppColors.clr_field,
                      ),
                      getStartActionButton(
                        context: context,
                        buttonColor: AppColors.clr_green,
                        icon: MdiIcons.check,
                        onPress: () => _alertDialogueContainer(
                          context,
                        ),
                        name: "Accept",
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
          horizontal: horizontalValue(18.0,),
          vertical: verticalValue(18.0,),
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
          horizontal: horizontalValue(18.0,),
          vertical: verticalValue(18.0,),
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
              border: Border.all(color: AppColors.clr_field),
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
                  alignment: Alignment.centerRight,
                  child: Text(
                    '\$' + '$amountHour' + '/h',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "MuliRegular",
                      color: AppColors.clr_bg_black,
                    ),
                  ),
                ),
                verticalSpacer(4.0),
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
                        onPress: () {},
                        name: "Cancel Gig",
                      ),
                      Container(
                        height: double.infinity,
                        width: 1,
                        color: AppColors.clr_field,
                      ),
                      getStartActionButton(
                        context: context,
                        buttonColor: AppColors.clr_bg_black,
                        icon: Entypo.flag,
                        onPress: () => _alertDialogueContainer(
                          context,
                        ),
                        name: "Start Gig",
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
          onPressed: () => onPress,
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
          onPressed: () => onPress,
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

  _newTaskModalBottomSheet(context) {
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
                                      Text("Waiter",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'MuliBold',
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text("Crown Hotel",
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
                                              Text("4.5",
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
                                      "Friday, 25 Sep",
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
                                      "10:00am - 5:00pm",
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
                                      "\$140 (\$20/h x 7 hours)",
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
                                      "John Doe",
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
                                      "Crown Hotel, New York, USA",
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
                            child: Image.asset(
                              Assets.google,
                              fit: BoxFit.fill,
                            ),
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
                                "Wear white shirt with black pants and black shoes.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.clr_bg_black,
                                  fontFamily: 'MuliRegular',
                                ),
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.clr_field,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: AppSizes.height * 0.06,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              width: 2.0,
                                              color: AppColors.clr_field),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding:
                                          EdgeInsets.all(AppSizes.width * 0.02),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Assets.cancelgig,
                                            height: 20,
                                            width: 20,
                                            color: AppColors.clr_bg_black,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.01,
                                          ),
                                          Text("Skip",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'MuliRegular',
                                                color: AppColors.clr_bg_black,
                                              )),
                                        ],
                                      )),
                                  Container(
                                      height: AppSizes.height * 0.06,
                                      padding:
                                          EdgeInsets.all(AppSizes.width * 0.02),
                                      decoration: BoxDecoration(
                                          color: AppColors.clr_white),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: AppColors.clr_green,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.01,
                                          ),
                                          Text("Accept",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.clr_green,
                                              )),
                                        ],
                                      )),
                                ],
                              )),
                        ],
                      ))
                ],
              ));
        });
  }

  _alertDialogueContainer(BuildContext context) {
    return {
      {
        showDialog(
          context: context,
          builder: (context) {
            return Material(
              color: AppColors.clr_bg_black.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: AppSizes.width * 0.15,
                        ),
                        height: AppSizes.height * 0.90,
                        color: AppColors.clr_bg,
                        child: ListView(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: AppSizes.height * 0.07),
                                child: Text(
                                  "Robert",
                                  style: TextStyle(
                                      fontSize: 22, fontFamily: "MuliBold"),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.01,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: AppSizes.width * 0.06,
                                  right: AppSizes.width * 0.06,
                                  top: AppSizes.height * 0.04,
                                  bottom: AppSizes.height * 0.04),
                              child: Text(
                                "Add compliment",
                                style: TextStyle(
                                    fontFamily: 'MuliBold', fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                width: AppSizes.width * 0.10,
                                height: AppSizes.height * 0.07,
                                margin: EdgeInsets.only(
                                    left: AppSizes.width * 0.04,
                                    right: AppSizes.width * 0.04),
                                padding: EdgeInsets.all(AppSizes.width * 0.03),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_black,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Assets.greeting,
                                          height: 25,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: AppSizes.width * 0.03,
                                        ),
                                        Container(
                                            child: Text(
                                          "Greeting",
                                          style: TextStyle(
                                            fontFamily: "MuliBold",
                                            fontSize: 15,
                                          ),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          size: 15,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height: AppSizes.height * 0.07,
                                margin: EdgeInsets.only(
                                    left: AppSizes.width * 0.04,
                                    right: AppSizes.width * 0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.venue_safety,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                      "Venue Safety",
                                      style: TextStyle(
                                        fontFamily: "MuliBold",
                                        fontSize: 15,
                                      ),
                                    )),
                                  ],
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.9,
                                height: AppSizes.height * 0.07,
                                margin: EdgeInsets.only(
                                    left: AppSizes.width * 0.04,
                                    right: AppSizes.width * 0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.work_atmosphere,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                      "Work Atmosphere",
                                      style: TextStyle(
                                        fontFamily: 'MuliBold',
                                        fontSize: 15,
                                      ),
                                    )),
                                  ],
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height: AppSizes.height * 0.07,
                                margin: EdgeInsets.only(
                                    left: AppSizes.width * 0.04,
                                    right: AppSizes.width * 0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.team_work,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                      "Team Work",
                                      style: TextStyle(
                                        fontFamily: 'MuliBold',
                                        fontSize: 15,
                                      ),
                                    )),
                                  ],
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height: AppSizes.height * 0.07,
                                margin: EdgeInsets.only(
                                    left: AppSizes.width * 0.04,
                                    right: AppSizes.width * 0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.management,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                      "Management",
                                      style: TextStyle(
                                        fontFamily: 'MuliBold',
                                        fontSize: 15,
                                      ),
                                    )),
                                  ],
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.03,
                            ),
                            CommonWidgets.getSignUpButton(
                                context: context,
                                text: "Submit Rating",
                                onPress: () {
                                  hideLoader(context);
                                }),
                            SizedBox(
                              height: AppSizes.height * 0.04,
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.38,
                        ),
                        height: AppSizes.width * 0.25,
                        width: AppSizes.width * 0.25,
                        child: Image.asset(
                          Assets.support,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
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

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
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
                    child: CommonWidgets.getSignUpButton(
                        context: context,
                        onPress: () {},
                        text: "Request Break"))
              ],
            ),
          );
        });
  }
}
