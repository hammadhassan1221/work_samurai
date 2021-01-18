import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/widgets/widgets.dart';

class OffersComponent {

  Widget _getHeading({String jobTitle}){
    return  Container(
      width: AppSizes.width/1.3,
      child: Text(
        '$jobTitle',
        style: TextStyle(
          fontSize: AppSizes.fontRatio*18,
          fontFamily: "MuliSemiBold",
          color: AppColors.clr_bg_black,
        ),
      ),
    );
  }

  Widget getSingleContainer({
    BuildContext context,
    String jobTitle,
    String dateTime,
    String location,
    double totalAmount,
    double amountHour,
    Function acceptJob,
    Function rejectJob,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.clr_field,
        ),
        color: AppColors.clr_white,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(5.0,),
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
               _getHeading(jobTitle: jobTitle),
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
                fontSize: 12,
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
                8.0,
              ),
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '\$' + '$amountHour' + '/h',
              style: TextStyle(
                fontSize: 12,
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
          Container(
            height: AppSizes.heightRatio * 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCancelActionButton(
                  context: context,
                  buttonColor: AppColors.clr_bg_black,
                  icon: Icons.close,
                  onPress: rejectJob,
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
                  onPress: acceptJob,
                  name: "Accept",
                )
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
          onPressed: onPress,
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
          onPressed:onPress,
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
                  fontSize: AppSizes.fontRatio * 12,
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

  alertDialogueContainer(BuildContext context) {
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
                                    fontSize: 18,
                                    fontFamily: "MuliBold",
                                  ),
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
                                bottom: AppSizes.height * 0.04,
                              ),
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
                                right: AppSizes.width * 0.04,
                              ),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        ),
                                      ),
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
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                              width: AppSizes.width * 0.12,
                              height: AppSizes.height * 0.07,
                              margin: EdgeInsets.only(
                                left: AppSizes.width * 0.04,
                                right: AppSizes.width * 0.04,
                              ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                              width: AppSizes.width * 0.9,
                              height: AppSizes.height * 0.07,
                              margin: EdgeInsets.only(
                                left: AppSizes.width * 0.04,
                                right: AppSizes.width * 0.04,
                              ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                              width: AppSizes.width * 0.12,
                              height: AppSizes.height * 0.07,
                              margin: EdgeInsets.only(
                                left: AppSizes.width * 0.04,
                                right: AppSizes.width * 0.04,
                              ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.03,
                            ),
                            CommonWidgets.getBottomButton(
                              name: "Submit Rating",
                              onButtonClick: () {},
                            ),
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }
}
