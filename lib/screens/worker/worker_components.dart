import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';
import 'package:work_samurai/widgets/widgets.dart';

class WorkerComponents {
  Widget getProfile() {
    return Container(
        height: AppSizes.height * 0.9,
        width: AppSizes.width * 0.9,
        color: AppColors.clr_bg,
        child: ListView(
          children: [
            Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Image.asset(
                            Assets.support,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Container(
                            width: AppSizes.width*0.60,
                            height: AppSizes.height/8,
                            child: Text(
                                "Edit",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )
                            )
                        )
                      ],
                    )
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Robert Miller",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'MuliBold',

                            )
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.02,
                        ),
                        Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
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
                                  width: AppSizes.width * 0.015,
                                ),
                                Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'MuliRegular',
                                      color: AppColors.clr_bg_black2,
                                    )
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      width: AppSizes.width * 0.85,
                      child: Text(
                          "New York",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.clr_bg_black,
                            fontFamily: 'MuliSemiBold',
                          )
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "Fusce maximus cursus lectus, varius ultricies erat molestie vel. Fusce sapien urna, rhoncus et tempor vel, placerat eu velit. Pellentesque nec felis pulvinar, luctus lectus eget!",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.clr_bg_black2,
                      fontFamily: 'MuliRegular',
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check,size:12
                        ),
                        SizedBox(
                          width: AppSizes.width*0.05,
                        ),
                        Text(
                          "Work rights verified",
                          style: TextStyle(
                            fontFamily: 'MuliSemiBold',
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        width: AppSizes.width * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,size: 12,
                        ),
                        SizedBox(
                          width: AppSizes.width*0.05,
                        ),
                        Text(
                          "Driver License verified",
                          style: TextStyle(
                            fontFamily: 'MuliSemiBold',
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: AppSizes.width * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,size: 12,
                        ),
                        SizedBox(width: AppSizes.width * 0.05,
                        ),
                        Text(
                          "Police check",
                          style: TextStyle(
                            fontFamily: 'MuliSemiBold',
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                  ],
                )
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "Completed Jobs",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.clr_bg_black,
                      fontFamily: 'MuliBold',
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuliSemiBold',
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "Positions",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.clr_bg_black,
                      fontFamily: 'MuliBold'
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Wrap(
                  children: [
                    Container(
                        padding: EdgeInsets.all(AppSizes.width*0.020),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Waiter",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(AppSizes.width*0.020),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Bartender",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(AppSizes.width*0.020),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Barista",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.08,
                    ),
                    Container(
                        padding: EdgeInsets.all(AppSizes.width*0.020),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Receptionist",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    )
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.03,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "Compliments",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.clr_bg_black,
                      fontFamily: 'MuliBold',
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Row(
                  children: [
                    Image.asset(Assets.diamond,
                        height: 25,
                        width: 25),
                    SizedBox(
                      width: AppSizes.width * 0.03,
                    ),
                    Text(
                      "Perfect Service",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'MuliSemiBold',
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.03,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                        ),
                        child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_grey,
                            )
                        )
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Row(
                  children: [
                    Image.asset(Assets.communicate,
                        height: 25,
                        width: 25),
                    SizedBox(
                      width: AppSizes.width * 0.03,
                    ),
                    Text(
                      "Good Communication",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'MuliSemiBold',
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.01,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                        ),
                        child: Text(
                            "10",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_grey,
                            )
                        )
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Row(
                  children: [
                    Image.asset(Assets.muscle,
                        height: 25,
                        width: 25),
                    SizedBox(
                      width: AppSizes.width * 0.03,
                    ),
                    Text(
                      "Hard Worker",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'MuliSemiBold',
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.03,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5,right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                        ),
                        child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_grey,
                            )
                        )
                    ),
                  ],
                )
            ),

          ],
        )
    );
  }

  Widget getMessages(BuildContext context) {
    return SafeArea(
      child: Container(
        height: AppSizes.height * 0.8,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
            children: [
              Container(
                  width: AppSizes.width,
                  height: AppSizes.height * 0.1,
                  padding: EdgeInsets.only(
                      left: AppSizes.width * 0.04, top: AppSizes.width * 0.07),
                  color: AppColors.clr_white,
                  child: Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'MuliBold',

                    ),
                  )
              ),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              Container(
                  width: AppSizes.width * 0.9,
                  height: AppSizes.height * 0.65,
                  color: AppColors.clr_bg,
                  child: Column(
                    children: [
                      Container(
                        height: AppSizes.height * 0.1,
                        width: AppSizes.width * 0.9,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.clr_field,
                            ),borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Assets.support,
                                  width: AppSizes.width * 0.13,
                                  height: AppSizes.height * 0.08,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: AppSizes.width * 0.01,
                                ),
                                Text(
                                  "Work Sumarai Support",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'MuliBold',

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,size: 15,
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
                          Navigator.push(
                              context, SlideRightRoute(page: ChatScreen()));
                        },
                        child: Container(
                          height: AppSizes.height * 0.11,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              //border: Border.all(color: AppColors.clr_bg_grey),
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
                                          "Crown Hotel",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
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
                                                    fontSize: 12,
                                                    fontFamily: 'MuliRegular',
                                                    color: AppColors
                                                        .clr_bg_black2,
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
                                      "Waiter . Wed, Sep 23",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.clr_bg_black2,
                                        fontFamily: 'MuliRegular',
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
      ),
    );
  }

  Widget getOffers(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            Container(
                width: AppSizes.width * 0.9,
                child: Column(
                  children: [
                    Container(
                        width: AppSizes.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.clr_bg_grey,
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white),
                        child: Column(
                          children: [
                            Container(
                              height: AppSizes.height * 0.18,
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Waiter",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliBold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.clr_bg_black,
                                            ),
                                          ),
                                          Text(
                                            "Wed, Sep 23",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          Text(
                                            "11:00 am - 1:00 pm",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.01,
                                          ),
                                          Text(
                                            "Crown Hotel, New York",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,),
                                              onPressed: () {
//                                              _newTaskModalBottomSheet(context);
                                              }
                                          ),
                                          Text(
                                            "140",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: Assets.muliRegular,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "20/h",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: Assets.muliRegular,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color: AppColors.clr_bg_black,
                                            ),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                  color: AppColors.clr_bg_black,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: AppColors.clr_green,
                                            ),
                                            Text(
                                                "Accept",
                                                style: TextStyle(
                                                  color: AppColors.clr_green,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    Container(
                        width: AppSizes.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.clr_bg_grey,
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white),
                        child: Column(
                          children: [
                            Container(
                              height: AppSizes.height * 0.18,
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Bartender",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliBold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.clr_bg_black,
                                            ),
                                          ),
                                          Text(
                                            "Wed, Sep 23",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          Text(
                                            "11:00 am - 1:00 pm",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.01,
                                          ),
                                          Text(
                                            "Crown Hotel, New York",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.clr_bg_grey,
                                          ),
                                          Text(
                                            "140",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: Assets.muliRegular,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "20/h",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: Assets.muliRegular,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color: AppColors.clr_bg_black,
                                            ),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                  color: AppColors.clr_bg_black,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: AppColors.clr_green,
                                            ),
                                            Text(
                                                "Accept",
                                                style: TextStyle(
                                                  color: AppColors.clr_green,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.04,
                    ),
                    Container(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.clr_bg_black,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    Container(
                        width: AppSizes.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.clr_bg_grey,
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              )
                            ],
                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white),
                        child: Column(
                          children: [
                            Container(
                              height: AppSizes.height * 0.18,
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Chef",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliBold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.clr_bg_black,
                                            ),
                                          ),
                                          Text(
                                            "Wed, Sep 23",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          Text(
                                            "11:00 am - 1:00 pm",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.01,
                                          ),
                                          Text(
                                            "Crown Hotel, New York",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.clr_bg_grey,
                                          ),
                                          Text(
                                            "140",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: Assets.muliRegular,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "20/h",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: Assets.muliRegular,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color: AppColors.clr_bg_black,
                                            ),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                  color: AppColors.clr_bg_black,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: AppColors.clr_green,
                                            ),
                                            Text(
                                                "Accept",
                                                style: TextStyle(
                                                  color: AppColors.clr_green,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
            )
          ],
        )
    );
  }

  Widget getInProgress() {
    return Container(
        child: Column(
          children: [
            Container(
              height: AppSizes.height * 0.4,
              width: AppSizes.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.clr_bg_grey,
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    )
                  ],
                  border: Border.all(color: AppColors.clr_bg_grey),
                  color: AppColors.clr_white),
              child: Column(
                children: [
                  Container(
                    height: AppSizes.height * 0.18,
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receptionist",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: Assets.muliBold,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                                Text(
                                  "Wed, Sep 23",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.clr_bg_grey,
                                  ),
                                ),
                                Text(
                                  "11:00 am - 1:00 pm",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.clr_bg_grey,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.01,
                                ),
                                Text(
                                  "Crown Hotel, New York",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.clr_bg_grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "140",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: Assets.muliRegular,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "20/h",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: Assets.muliRegular,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: AppColors.clr_bg_grey,
                            ),
                            SizedBox(
                              width: AppSizes.width * 0.02,
                            ),
                            Text(
                              "Check-up Time",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: Assets.muliRegular,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "10:02 am",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: Assets.muliRegular,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                          "04 : 22 : 53",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          )
                      )
                  ),
                ],
              ),
            ),
            Container(
              width: AppSizes.width * 0.9,
              height: AppSizes.height * 0.08,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                top: AppSizes.height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                border: Border.all(color: AppColors.clr_bg_black,),
                color: AppColors.transparentColor,
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Request Break",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    color: AppColors.clr_bg_black,
                  ),
                ),
              ),
            ),
            Container(
              width: AppSizes.width * 0.9,
              height: AppSizes.height * 0.08,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                top: AppSizes.height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                border: Border.all(color: AppColors.clr_bg_black,),
                color: AppColors.clr_bg_black,
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "End Shift",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    color: AppColors.clr_white,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget getConfirmed() {
    Container(
        child: Column(
          children: [
            Container(
                width: AppSizes.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.clr_bg_grey,
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      )
                    ],
                    border: Border.all(color: AppColors.clr_bg_grey),
                    color: AppColors.clr_white),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.18,
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Receptionist",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: Assets.muliBold,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.clr_bg_black,
                                    ),
                                  ),
                                  Text(
                                    "Wed, Sep 23",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                    ),
                                  ),
                                  Text(
                                    "11:00 am - 1:00 pm",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                  Text(
                                    "Crown Hotel, New York",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  Text(
                                    "140",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: Assets.muliRegular,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "20/h",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Assets.muliRegular,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_bg_grey),
                                    right: BorderSide(width: 2.0,
                                        color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(left: 15.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color: AppColors.clr_red,
                                    ),
                                    Text(
                                        "Cancel Gig",
                                        style: TextStyle(
                                          color: AppColors.clr_red,
                                        )
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 15.0,
                                    right: 10.0,
                                    top: 4.0,
                                    bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  children: [
                                    Image.asset(Assets.start_gig,
                                        height: 30,
                                        width: 30),
                                    Text(
                                        "Start Gig",
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
                width: AppSizes.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.clr_bg_grey,
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      )
                    ],
                    border: Border.all(color: AppColors.clr_bg_grey),
                    color: AppColors.clr_white),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.18,
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cleaner",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: Assets.muliBold,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.clr_bg_black,
                                    ),
                                  ),
                                  Text(
                                    "Wed, Sep 23",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                    ),
                                  ),
                                  Text(
                                    "11:00 am - 1:00 pm",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                  Text(
                                    "Crown Hotel, New York",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.clr_bg_grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  Text(
                                    "140",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: Assets.muliRegular,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "20/h",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Assets.muliRegular,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_bg_grey),
                                    right: BorderSide(width: 2.0,
                                        color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(left: 15.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color: AppColors.clr_red,
                                    ),
                                    Text(
                                        "Cancel Gig",
                                        style: TextStyle(
                                          color: AppColors.clr_red,
                                        )
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 15.0,
                                    right: 10.0,
                                    top: 4.0,
                                    bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  children: [
                                    Image.asset(Assets.start_gig,
                                        height: 30,
                                        width: 30),
                                    Text(
                                        "Start Gig",
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }

  Widget getOffersContainer(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            Container(
                width: AppSizes.width * 0.9,
                child: Column(
                  children: [
                    Container(
                      width: AppSizes.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),

                          border: Border.all(color: AppColors.clr_bg_grey),
                          color: AppColors.clr_white),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _newTaskModalBottomSheet(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Bartender",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'MuliSemiBold',
                                              color: AppColors.clr_bg_black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.015,),
                                          Text(
                                            "Wed, Sep 23",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.clr_bg_black2,
                                                fontFamily: 'MuliRegular'
                                            ),
                                          ),

                                          SizedBox(
                                            height: AppSizes.height * 0.03,
                                          ),
                                          Text(
                                            "Crown Hotel, New York",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_black2,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _newTaskModalBottomSheet(
                                                  context);
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15, color: Colors.grey,),
                                          ),
                                          Text(
                                            "\$140",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.clr_bg_black,
                                              fontFamily: 'MuliSemiBold',

                                            ),
                                          ),
                                          Text(
                                            "\$20/h",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'MuliRegular',
                                              color: AppColors.clr_bg_black2,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(width: 2.0,
                                              color: AppColors.clr_field),
                                          right: BorderSide(width: 2.0,
                                              color: AppColors.clr_field),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.only(left: 50.0,
                                          right: 10.0,
                                          top: 10.0,
                                          bottom: 10.0),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          Icon(
                                            Icons.clear,size: 16,
                                            color: AppColors.clr_bg_black,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.02,),
                                          Text(
                                              "Skip",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .clr_bg_black,
                                                  fontSize: 17,fontFamily: 'MuliRegular'
                                              )
                                          ),
                                        ],
                                      )
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _alertDialogueContainer(context);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_field),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,size: 16,
                                              color: AppColors.clr_green,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Accept",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .clr_green,
                                                    fontSize: 17,fontFamily: 'MuliRegular'
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                  ),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    Container(
                        width: AppSizes.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),

                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _newTaskModalBottomSheet(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Bartender",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'MuliSemiBold',
                                                color: AppColors.clr_bg_black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSizes.height * 0.015,),
                                            Text(
                                              "Wed, Sep 23",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.clr_bg_black2,
                                                  fontFamily: 'MuliRegular'
                                              ),
                                            ),

                                            SizedBox(
                                              height: AppSizes.height * 0.03,
                                            ),
                                            Text(
                                              "Crown Hotel, New York",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.clr_bg_black2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                _newTaskModalBottomSheet(
                                                    context);
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15, color: Colors.grey,),
                                            ),
                                            Text(
                                              "\$140",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.clr_bg_black,
                                                fontFamily: 'MuliSemiBold',

                                              ),
                                            ),
                                            Text(
                                              "\$20/h",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'MuliRegular',
                                                color: AppColors.clr_bg_black2,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_field),
                                            right: BorderSide(width: 2.0,
                                                color: AppColors.clr_field),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Icon(
                                              Icons.clear,size: 16,
                                              color: AppColors.clr_bg_black,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .clr_bg_black,
                                                    fontSize: 17,fontFamily: 'MuliRegular'
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _alertDialogueContainer(context);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(left: 50.0,
                                              right: 10.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(width: 2.0,
                                                  color: AppColors.clr_field),
                                            ),
                                            color: Colors.white,
                                          ),
                                          width: AppSizes.width * 0.44,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.check,size: 16,
                                                color: AppColors.clr_green,
                                              ),
                                              SizedBox(
                                                width: AppSizes.width * 0.02,),
                                              Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .clr_green,
                                                      fontSize: 17,fontFamily: 'MuliRegular'
                                                  )
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.04,
                    ),
                    _container(),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    Container(
                        width: AppSizes.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),

                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _newTaskModalBottomSheet(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Bartender",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'MuliSemiBold',
                                                color: AppColors.clr_bg_black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSizes.height * 0.015,),
                                            Text(
                                              "Wed, Sep 23",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.clr_bg_black2,
                                                  fontFamily: 'MuliRegular'
                                              ),
                                            ),

                                            SizedBox(
                                              height: AppSizes.height * 0.03,
                                            ),
                                            Text(
                                              "Crown Hotel, New York",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.clr_bg_black2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                _newTaskModalBottomSheet(
                                                    context);
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15, color: Colors.grey,),
                                            ),
                                            Text(
                                              "\$140",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.clr_bg_black,
                                                fontFamily: 'MuliSemiBold',

                                              ),
                                            ),
                                            Text(
                                              "\$20/h",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'MuliRegular',
                                                color: AppColors.clr_bg_black2,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_field),
                                            right: BorderSide(width: 2.0,
                                                color: AppColors.clr_field),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Icon(
                                              Icons.clear,size: 16,
                                              color: AppColors.clr_bg_black,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .clr_bg_black,
                                                    fontSize: 17,fontFamily: 'MuliRegular'
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _alertDialogueContainer(context);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(left: 50.0,
                                              right: 10.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(width: 2.0,
                                                  color: AppColors.clr_field),
                                            ),
                                            color: Colors.white,
                                          ),
                                          width: AppSizes.width * 0.44,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.check,size: 16,
                                                color: AppColors.clr_green,
                                              ),
                                              SizedBox(
                                                width: AppSizes.width * 0.02,),
                                              Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .clr_green,
                                                      fontSize: 17,fontFamily: 'MuliRegular'
                                                  )
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
            )
          ],
        )
    );
  }

  _container() {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 20.0),
        child: Text(
          "Apply",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'MuliBold',
            color: AppColors.clr_bg_black,
          ),
        )
    );
  }

  Widget getInProgressContainer() {
    return Container(
        child: Column(
          children: [
            Container(
              height: AppSizes.height * 0.45,
              width: AppSizes.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.clr_bg_grey),
                  color: AppColors.clr_white),
              child: Column(
                children: [
                  Container(
                    height: AppSizes.height * 0.21,
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receptionist",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'MuliSemiBold',

                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.02,),
                                Text(
                                  "Wed, Sep 23",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'MuliRegular',
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.height * 0.03,
                                ),
                                Text(
                                  "Crown Hotel, New York",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'MuliRegular',
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "\$140",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'MuliSemiBold',
                                    color: AppColors.clr_bg_black

                                  ),
                                ),
                                Text(
                                  "\$20/h",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.clr_bg_black2,
                                    fontFamily: 'MuliRegular',
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.only(right: AppSizes.width*0.05, left: AppSizes.width*0.05, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.brightness_1,size: 13,
                              color: AppColors.clr_bg_black,
                            ),
                            SizedBox(
                              width: AppSizes.width * 0.02,
                            ),
                            Text(
                              "Check-up Time",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'MuliRegular',
                                color: AppColors.clr_bg_black
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "10:02 am",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.clr_bg_black,
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
                    height: AppSizes.height*0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "04 : 22 : 53",
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'MuliBold',
                              color: AppColors.clr_bg_black
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: AppSizes.width * 0.9,
              height: AppSizes.height * 0.08,
              margin: EdgeInsets.only(
                top: AppSizes.height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                border: Border.all(color: AppColors.clr_bg_black,),
                color: AppColors.transparentColor,
              ),
              child: FlatButton(
                onPressed: () {

                },
                child: Text(
                  "Request Break",
                  style: TextStyle(
                    fontFamily: 'MuliRegular',
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    color: AppColors.clr_bg_black,
                  ),
                ),
              ),
            ),
            Container(
              width: AppSizes.width * 0.9,
              height: AppSizes.height * 0.08,
              margin: EdgeInsets.only(
                top: AppSizes.height * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                border: Border.all(color: AppColors.clr_bg_black,),
                color: AppColors.clr_bg_black,
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "End Shift",
                  style: TextStyle(
                    fontFamily: 'MuliRegular',
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    color: AppColors.clr_white,
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget getConfirmedContainer() {
    return Container(
        child: Column(
          children: [
            Container(
                width: AppSizes.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.clr_field),
                    color: AppColors.clr_white),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.20,
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Receptionist",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "MuliSemiBold",
                                      color: AppColors.clr_bg_black,
                                    ),
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  Text(
                                    "Wed, Sep 23",
                                    style: TextStyle(
                                      fontFamily: 'MuliSemiRegular',
                                      fontSize: 15,
                                      color: AppColors.clr_bg_black2,
                                    ),
                                  ),

                                  SizedBox(
                                    height: AppSizes.height * 0.03,
                                  ),
                                  Text(
                                    "Crown Hotel, New York",
                                    style: TextStyle(
                                      fontFamily: 'MuliRegular',
                                      fontSize: 15,
                                      color: AppColors.clr_bg_black2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_forward_ios,size: 15,color: AppColors.clr_bg_black2,),
                                  Text(
                                    "\$140",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'MuliBold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "\$20/h",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'MuliRegular',
                                      color: AppColors.clr_bg_black2
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_field),
                                    right: BorderSide(width: 2.0,
                                        color: AppColors.clr_field),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(AppSizes.width*0.02),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(Assets.cancelgig,
                                        height: 24,
                                        width: 24),

                                    SizedBox(width: AppSizes.width * 0.01,),
                                    Text(
                                        "Cancel Gig",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'MuliRegular',color: AppColors.clr_red,
                                        )
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                padding: EdgeInsets.all(AppSizes.width*0.02),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_field),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(Assets.start_gig,
                                        height: 24,
                                        width: 24),
                                    SizedBox(width: AppSizes.width * 0.01,),
                                    Text(
                                        "Start Gig",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.clr_bg_black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
                width: AppSizes.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.clr_field),
                    color: AppColors.clr_white),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.height * 0.20,
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Receptionist",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "MuliSemiBold",
                                      color: AppColors.clr_bg_black,
                                    ),
                                  ),
                                  SizedBox(height: AppSizes.height * 0.02),
                                  Text(
                                    "Wed, Sep 23",
                                    style: TextStyle(
                                      fontFamily: 'MuliSemiRegular',
                                      fontSize: 15,
                                      color: AppColors.clr_bg_black2,
                                    ),
                                  ),

                                  SizedBox(
                                    height: AppSizes.height * 0.03,
                                  ),
                                  Text(
                                    "Crown Hotel, New York",
                                    style: TextStyle(
                                      fontFamily: 'MuliRegular',
                                      fontSize: 15,
                                      color: AppColors.clr_bg_black2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_forward_ios,size: 15,color: AppColors.clr_bg_black2,),
                                  Text(
                                    "\$140",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'MuliBold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "\$20/h",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'MuliRegular',
                                        color: AppColors.clr_bg_black2
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_field),
                                    right: BorderSide(width: 2.0,
                                        color: AppColors.clr_field),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(AppSizes.width*0.02),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(Assets.cancelgig,
                                        height: 24,
                                        width: 24),

                                    SizedBox(width: AppSizes.width * 0.01,),
                                    Text(
                                        "Cancel Gig",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'MuliRegular',color: AppColors.clr_red,
                                        )
                                    ),
                                  ],
                                )
                            ),
                            Container(
                                padding: EdgeInsets.all(AppSizes.width*0.02),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0,
                                        color: AppColors.clr_field),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(Assets.start_gig,
                                        height: 24,
                                        width: 24),
                                    SizedBox(width: AppSizes.width * 0.01,),
                                    Text(
                                        "Start Gig",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.clr_bg_black,
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }

  void _newTaskModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )
              ),
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
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              "Waiter",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: Assets.muliBold,

                                              )
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.03,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(2.0),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(10.0),
                                                  border: Border.all(
                                                    color: AppColors
                                                        .clr_bg_grey,
                                                  )
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      Assets.star,
                                                      width: 10,
                                                      height: 10),
                                                  Text(
                                                      "4.5",
                                                      style: TextStyle(
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
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            "Crown Hotel",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_black,
                                              fontFamily: Assets.muliSemiBold,
                                            )
                                        ),
                                      ),
                                    ],
                                  )
                              ),
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
                            padding: EdgeInsets.all(5,),
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
                                    SizedBox(width: AppSizes.width * 0.03,),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
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
                                        fontFamily: Assets.muliRegular,

                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5,),
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
                                    SizedBox(width: AppSizes.width * 0.03,),
                                    Text(
                                      "Time",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
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
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5,),
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
                                    SizedBox(width: AppSizes.width * 0.03,),
                                    Text(
                                      "Pay",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
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
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5,),
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
                                    SizedBox(width: AppSizes.width * 0.03,),
                                    Text(
                                      "Contact Person",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
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
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5,),
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
                                    SizedBox(width: AppSizes.width * 0.03,),
                                    Text(
                                      "Place",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
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
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.height * 0.02,),

                          Divider(),

                          SizedBox(height: AppSizes.height * 0.02,),
                          Container(
                            height: AppSizes.height * 0.4,
                            width: AppSizes.width,
                            child: Image.asset(
                              Assets.google, fit: BoxFit.fill,),
                          ),
                          Divider(),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Instructions",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: Assets.muliBold,
                                  color: AppColors.clr_bg_black,
                                ),
                              )
                          ),
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
                                  fontFamily: Assets.muliRegular,
                                ),
                              )
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            width: AppSizes.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.clr_bg_grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                border: Border.all(
                                    color: AppColors.clr_bg_grey),
                                color: AppColors.clr_white),
                            child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color: AppColors.clr_bg_black,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.clr_bg_black,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 50.0,
                                            right: 10.0,
                                            top: 10.0,
                                            bottom: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0,
                                                color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width * 0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: AppColors.clr_green,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Accept",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.clr_green,
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      )
                  )


                ],
              )
          );
        }
    );
  }


  _alertDialogueContainer(BuildContext context) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.clr_bg_black.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: AppSizes.width * 0.15,

                        ),
                        height: AppSizes.height*0.90,
                        color: AppColors.clr_bg,
                        child: ListView(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top:AppSizes.height*0.07),
                                child: Text("Robert",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "MuliBold"
                                  ),
                                  textAlign: TextAlign.center,)),
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

                              margin: EdgeInsets.only(left:AppSizes.width*0.06,right:AppSizes.width*0.06,top: AppSizes.height*0.04,bottom: AppSizes.height*0.04),
                              child: Text("Add compliment",style: TextStyle(fontFamily: 'MuliBold',fontSize: 18),
                                textAlign: TextAlign.center,),
                            ),



                            Container(
                                width: AppSizes.width * 0.12,
                                height:AppSizes.height*0.1,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
                                padding: EdgeInsets.all(AppSizes.width*0.03),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_black,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
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
                                            )
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.check,size: 13,)
                                      ],
                                    )

                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height:AppSizes.height*0.1,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
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
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.9,

                                height:AppSizes.height*0.1,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
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
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,

                                height:AppSizes.height*0.1,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
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
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height:AppSizes.height*0.1,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
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
                                        )
                                    ),
                                  ],
                                )
                            ),

                            /*GestureDetector(
                              onTap: (){
                                hideLoader(context);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: AppSizes.width*0.04,left: AppSizes.width*0.06,right: AppSizes.width*0.06,),
                                  alignment: Alignment.center,
                                  width: AppSizes.width/2,
                                  height: AppSizes.height * 0.095,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.clr_bg_black,
                                    border: Border.all(
                                      color: AppColors.clr_bg_grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "Submit Rating",
                                    style: TextStyle(
                                      color: AppColors.clr_white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            )*/

                            SizedBox(
                              height: AppSizes.height * 0.03,
                            ),

                            CommonWidgets.getButton(backgroundColor: AppColors.clr_bg_black, borderColor: AppColors.transparentColor, textColor: AppColors.clr_white, text: "SUBMIT", onPress: (){hideLoader(context);}),

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

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

}
