import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/business_messages/business_chat.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';

class BusinessChatRoom extends StatefulWidget {
  @override
  _BusinessChatRoomState createState() => _BusinessChatRoomState();
}

class _BusinessChatRoomState extends State<BusinessChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.clr_field,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
                width: AppSizes.width,
                height: AppSizes.height * 0.1,
                padding: EdgeInsets.only(
                    left: AppSizes.width * 0.04, top: AppSizes.width * 0.07),
                color: AppColors.clr_bg,
                child: Text(
                  "Messages",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: AppColors.clr_bg_black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
                width: AppSizes.width * 0.9,
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.1,
                      width: AppSizes.width * 0.9,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.clr_bg_grey,
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.support,
                                width: AppSizes.width * 0.08,
                                height: AppSizes.height * 0.04,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: AppSizes.width * 0.01,
                              ),
                              Text(
                                "Work Sumarai Support",
                                style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontFamily: Assets.muliBold,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, SlideRightRoute(page: BusinessMessages()));
                      },
                      child: Container(
                        height: AppSizes.height * 0.11,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),

                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.support),
                            SizedBox(
                              width: AppSizes.width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "Bartender",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          fontFamily: Assets.muliBold,
                                        )
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.02,
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(10.0),
                                            border: Border.all(
                                              color: AppColors.clr_bg_grey,
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                Assets.star,
                                                width: 10,
                                                height: 10),
                                            SizedBox(
                                              width: AppSizes.width * 0.01,
                                            ),
                                            Text(
                                                "4.5",
                                                style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontSize: 12,
                                                  fontFamily: Assets
                                                      .muliRegular,
                                                  color: AppColors
                                                      .clr_bg_grey,
                                                )
                                            )
                                          ],
                                        )


                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.010,
                                ),
                                Text(
                                    "Wed, Sep 23, 11:00am - 1:00pm",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                      fontFamily: Assets.muliRegular,
                                    )
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: AppSizes.height*0.02,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, SlideRightRoute(page: ChatScreen()));
                      },
                      child: Container(
                        height: AppSizes.height * 0.11,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),

                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.support),
                            SizedBox(
                              width: AppSizes.width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        "Bartender",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                          decoration: TextDecoration.none,
                                          fontSize: 16,
                                          fontFamily: Assets.muliBold,
                                        )
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.02,
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius
                                                .circular(10.0),
                                            border: Border.all(
                                              color: AppColors.clr_bg_grey,
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                Assets.star,
                                                width: 10,
                                                height: 10),
                                            SizedBox(
                                              width: AppSizes.width * 0.01,
                                            ),
                                            Text(
                                                "4.9",
                                                style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                  fontSize: 12,
                                                  fontFamily: Assets
                                                      .muliRegular,
                                                  color: AppColors
                                                      .clr_bg_grey,
                                                )
                                            )
                                          ],
                                        )


                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.010,
                                ),
                                Text(
                                    "Wed, Sep 23, 11:00am - 1:00pm",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                      fontFamily: Assets.muliRegular,
                                    )
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
          ]),
    );
  }
}
