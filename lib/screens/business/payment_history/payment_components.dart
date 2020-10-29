import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/application/application.dart';

class PaymentComponents{
  Widget getAppBar({@required String text , @required BuildContext context}) {

    return SafeArea(
      child: Container(
        height: AppSizes.height * 0.09,
        width: AppSizes.width,
        color: AppColors.clr_white,
        margin: EdgeInsets.only(top: AppSizes.height*0.02),
        padding: EdgeInsets.all(AppSizes.width * 0.042),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Image.asset(Assets.barArrow,height: 20,width: 20,)),

            SizedBox(
              width: AppSizes.width * 0.02,
            ),
            Text(
              text,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 22,
                  fontFamily: Assets.muliBold),
            )
          ],
        ),
      ),
    );

  }


  Widget getDailyPayment(BuildContext context) {
    return /* Container(
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
                            GestureDetector(
                              onTap: () { },
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
                                              "Waiter",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: Assets.muliSemiBold,
                                                color: AppColors.clr_bg_black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppSizes.height * 0.015,),
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
                                                fontSize: 22,
                                                fontFamily: Assets.muliSemiBold,

                                              ),
                                            ),
                                            Text(
                                              "\$20/h",
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
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
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
                                                    color: AppColors
                                                        .clr_bg_black,
                                                    fontSize: 17
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _newTaskModalBottomSheet2(context);
                                      },
                                      child: Container(
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
                                                      color: AppColors
                                                          .clr_green,
                                                      fontSize: 16
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
                              padding: EdgeInsets.all(10.0),
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
                                              fontSize: 20,
                                              fontFamily: Assets.muliSemiBold,
                                              color: AppColors.clr_bg_black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.015,),
                                          Text(
                                            "Wed, Sep 23",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliRegular,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          Text(
                                            "11:00 am - 1:00 pm",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliRegular,
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
                                              fontFamily: Assets.muliRegular,
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
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward_ios, size: 15,
                                              color: Colors.grey,),
                                          ),
                                          Text(
                                            "\$140",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: Assets.muliSemiBold,

                                            ),
                                          ),
                                          Text(
                                            "\$20/h",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: Assets.muliSemiBold,
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
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .clr_bg_black,
                                                    fontSize: 16
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
                                                    color: AppColors.clr_green,
                                                    fontSize: 16
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
                    _container(),
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
                              padding: EdgeInsets.all(10.0),
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
                                              fontSize: 20,
                                              fontFamily: Assets.muliSemiBold,

                                              color: AppColors.clr_bg_black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.015,),
                                          Text(
                                            "Wed, Sep 23",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliSemiBold,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          Text(
                                            "11:00 am - 1:00 pm",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: Assets.muliSemiBold,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                          ),
                                          SizedBox(
                                            height: AppSizes.height * 0.01,
                                          ),
                                          Text(
                                            "Crown Hotel, New York",
                                            style: TextStyle(
                                              fontFamily: Assets.muliSemiBold,
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
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward_ios, size: 15,
                                              color: Colors.grey,),
                                          ),
                                          Text(
                                            "\$140",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: Assets.muliBold,
                                            ),
                                          ),
                                          Text(
                                            "\$20/h",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: Assets.muliBold,
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
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Skip",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .clr_bg_black,
                                                    fontSize: 16
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
                                                    color: AppColors.clr_green,
                                                    fontSize: 16
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
    );*/
      Container(
        decoration: BoxDecoration(
          color: AppColors.clr_field,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.clr_white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Waiter",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontFamily: Assets.muliBold,
                              )),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: AppColors.clr_green,
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  )),
                              child: Text("1/1",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: Assets.muliRegular,
                                    color: AppColors.clr_bg_grey,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.01,
                      ),
                      Text("Wed, Sep 23, 11:00am - 1:00pm",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.clr_bg_grey,
                            fontFamily: Assets.muliRegular,
                          )),
                      SizedBox(
                        height: AppSizes.height * 0.01,
                      ),
                      Text("Crown Hotel, New York",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.clr_bg_grey,
                            fontFamily: Assets.muliRegular,
                          )),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.support,
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Your Samurai is on way!",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.clr_green,
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: Assets.muliSemiBold,
                                  )),
                              SizedBox(
                                width: AppSizes.width * 0.02,
                              ),
                              Text("Michael",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 16,
                                    color: AppColors.clr_bg_black,
                                    fontFamily: Assets.muliBold,
                                  )),
                              SizedBox(
                                width: AppSizes.width * 0.02,
                              ),
                              Text("ETA: 10 minutes",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    color: AppColors.clr_bg_black,
                                    fontFamily: Assets.muliBold,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.clr_white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Waiter",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontFamily: Assets.muliBold,
                              )),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: AppColors.clr_red,
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  )),
                              child: Text("1/3",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: Assets.muliRegular,
                                    color: AppColors.clr_bg_grey,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.01,
                      ),
                      Text("Wed, Sep 23, 11:00am - 1:00pm",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.clr_bg_grey,
                            fontFamily: Assets.muliRegular,
                          )),
                      SizedBox(
                        height: AppSizes.height * 0.01,
                      ),
                      Text("Crown Hotel, New York",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.clr_bg_grey,
                            fontFamily: Assets.muliRegular,
                          )),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, SlideRightRoute(page: Application()));
                        },
                        child: Container(
                          height: AppSizes.height * 0.07,
                          width: AppSizes.width,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 0.5, color: AppColors.clr_bg_grey),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.applicants,
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: AppSizes.width * 0.02,
                              ),
                              Text("View Application")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }

  Widget getProgressContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.clr_field,
      ),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.clr_white,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Waiter",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontFamily: Assets.muliSemiBold,
                              )),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Text("Michael",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: AppColors.clr_bg_black,
                                fontFamily: Assets.muliBold,
                              )),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Text("Wed, Sep 23,11:00am - 1:00pm",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_grey,
                                fontFamily: Assets.muliRegular,
                              )),
                          Text("Crown Hotel, New York",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_grey,
                                fontFamily: Assets.muliRegular,
                              ))
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.height * 0.02),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Assets.checkintime,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.01,
                            ),
                            Text(
                              "Check-in-time",
                              style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            )
                          ],
                        ),
                        Row(children: [
                          Text(
                            "10:58am",
                            style: TextStyle(
                                color: AppColors.clr_bg_black,
                                fontFamily: Assets.muliRegular,
                                fontSize: 15),
                          )
                        ])
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ))),
                    child: Text(
                      "04 : 22 :53",
                      style: TextStyle(
                          color: AppColors.clr_bg_black, fontSize: 40),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: AppColors.clr_bg_grey),
                        )),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    width: 2.0, color: AppColors.clr_bg_grey),
                              ),
                              color: Colors.white,
                            ),
                            width: AppSizes.width / 2.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.breakcup,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: AppSizes.width * 0.02,
                                ),
                                Text("Give Break",
                                    style: TextStyle(
                                        color: AppColors.clr_bg_black,
                                        fontSize: 14)),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            width: AppSizes.width / 2.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.endshift,
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: AppSizes.width * 0.02,
                                ),
                                Text("End Shift",
                                    style: TextStyle(
                                        color: AppColors.clr_bg_black,
                                        fontSize: 14)),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget getPastContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.clr_field,
      ),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.clr_white,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Waiter",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontFamily: Assets.muliSemiBold,
                              )),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Text("Michael",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: AppColors.clr_bg_black,
                                fontFamily: Assets.muliBold,
                              )),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Text("Wed, Sep 23,11:00am - 1:00pm",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_grey,
                                fontFamily: Assets.muliRegular,
                              )),
                          Text("Crown Hotel, New York",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_grey,
                                fontFamily: Assets.muliRegular,
                              ))
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.height * 0.02),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ))),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.checkintime,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Michael",
                              style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            ),
                            Text(
                              "11:00am - 1:23pm",
                              style: TextStyle(
                                  color: AppColors.clr_bg_grey,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.height * 0.02),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.checkintime,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Michael",
                              style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            ),
                            Text(
                              "11:00am - 1:23pm",
                              style: TextStyle(
                                  color: AppColors.clr_bg_grey,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: AppColors.clr_bg_grey),
                        )),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Navigator.push(
                                //context,
                                //SlideRightRoute(
                                   // page: _alertDialogueContainer(context)));
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              width: AppSizes.width / 2.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.02,
                                  ),
                                  Text("Rate Samurai",
                                      style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                          fontSize: 14)),
                                ],
                              )),
                        ),
                        Container(
                          width: 2,
                          height: AppSizes.height * 0.07,
                          color: AppColors.clr_bg_grey,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            width: AppSizes.width / 2.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: AppColors.clr_bg_black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: AppSizes.width * 0.02,
                                ),
                                Text("Email Receipt",
                                    style: TextStyle(
                                        color: AppColors.clr_bg_black,
                                        fontSize: 14)),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.clr_white,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Waiter",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                fontFamily: Assets.muliSemiBold,
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.03,
                          ),
                          Text("Wed, Sep 23,11:00am - 1:00pm",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_grey,
                                fontFamily: Assets.muliRegular,
                              )),
                          Text("Crown Hotel, New York",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_grey,
                                fontFamily: Assets.muliRegular,
                              ))
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.height * 0.02),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: AppColors.clr_bg_grey,
                              width: 1,
                            ))),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.checkintime,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Michael",
                              style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            ),
                            Text(
                              "11:00am - 1:23pm",
                              style: TextStyle(
                                  color: AppColors.clr_bg_grey,
                                  fontFamily: Assets.muliRegular,
                                  fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: AppColors.clr_bg_grey),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: AppColors.clr_bg_black,
                          size: 20,
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.02,
                        ),
                        Text("Email Receipt",
                            style: TextStyle(
                                color: AppColors.clr_bg_black, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}