import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class WorkerCmoponents{
  Widget getProfile(){
    return Container(
        height: AppSizes.height*0.9,
        width: AppSizes.width*0.9,
        color: AppColors.clr_bg,
        child: ListView(
          children: [
            Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.0,top:10.0),
                          child: Image.asset(
                            Assets.support,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: AppSizes.width*0.55,
                              child: Text(
                                  "Edit",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )
                              )
                          ),
                        )
                      ],
                    )
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                            "Robert Miller",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: Assets.muliBold,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        SizedBox(
                          width: AppSizes.width*0.01,
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
                                Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Assets.muliRegular,
                                      color: AppColors.clr_bg_grey,
                                    )
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      width: AppSizes.width*0.85,
                      child: Text(
                          "New York",
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
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Text(
                    "Fusce maximus cursus lectus, varius ultricies erat molestie vel. Fusce sapien urna, rhoncus et tempor vel, placerat eu velit. Pellentesque nec felis pulvinar, luctus lectus eget!",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.clr_bg_grey,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Work rights verified",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height*0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Driver License verified",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height*0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Police check",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height*0.01,
                    ),
                  ],
                )
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Text(
                    "Completed Jobs",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.clr_bg_black,
                      fontWeight: FontWeight.bold,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Text(
                    "Positions",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.clr_bg_black,
                      fontWeight: FontWeight.bold,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(12.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_bg_grey,
                        ),
                        child: Text(
                            "Waiter",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width*0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(12.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_bg_grey,
                        ),
                        child: Text(
                            "Bartender",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width*0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(12.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_bg_grey,
                        ),
                        child: Text(
                            "Barista",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(12.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_bg_grey,
                        ),
                        child: Text(
                            "Receptionist",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Text(
                    "Compliments",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.clr_bg_black,
                      fontWeight: FontWeight.bold,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Row(
                  children: [
                    Image.asset(Assets.icon_voters_card,
                        height: 30,
                        width: 30),
                    SizedBox(
                      width: AppSizes.width*0.01,
                    ),
                    Text(
                      "Perfect Service",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width*0.01,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                        ),
                        child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.muliRegular,
                              color: AppColors.clr_bg_grey,
                            )
                        )
                    ),
                  ],
                )
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Row(
                  children: [
                    Image.asset(Assets.icon_voters_card,
                        height: 30,
                        width: 30),
                    SizedBox(
                      width: AppSizes.width*0.01,
                    ),
                    Text(
                      "Good Communication",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width*0.01,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                        ),
                        child: Text(
                            "10",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.muliRegular,
                              color: AppColors.clr_bg_grey,
                            )
                        )
                    ),
                  ],
                )
            ),
            Container(
                width: AppSizes.width*0.85,
                child: Row(
                  children: [
                    Image.asset(Assets.icon_voters_card,
                        height: 30,
                        width: 30),
                    SizedBox(
                      width: AppSizes.width*0.01,
                    ),
                    Text(
                      "Hard Worker",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes.width*0.01,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                        ),
                        child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.muliRegular,
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

  Widget getMessages(){
    return SafeArea(
      child: Container(
        height: AppSizes.height*0.8,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
            children: [
              Container(
                  width: AppSizes.width,
                  height: AppSizes.height*0.1,
                  padding: EdgeInsets.only(left: 15.0, top: 20.0),
                  color: AppColors.clr_white,
                  child: Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: Assets.muliBold,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              SizedBox(
                height: AppSizes.height*0.02,
              ),
              Container(
                  width: AppSizes.width*0.9,
                  height: AppSizes.height*0.65,
                  color: AppColors.clr_bg,
                  child: Column(
                    children: [
                      Container(
                        height: AppSizes.height*0.1,
                        width: AppSizes.width*0.9,
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
                                  width: AppSizes.width*0.01,
                                ),
                                Text(
                                  "Work Sumarai Support",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: Assets.muliBold,
                                      fontWeight: FontWeight.bold
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
                        height: AppSizes.height*0.02,
                      ),
                      Container(
                        height: AppSizes.height*0.1,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.clr_bg_grey,
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: Offset(0,0),
                              )
                            ],
                            border: Border.all(color: AppColors.clr_bg_grey),
                            color: AppColors.clr_white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.support),
                            SizedBox(
                              width: AppSizes.width*0.02,
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
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    SizedBox(
                                      width: AppSizes.width*0.01,
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
                                            Text(
                                                "4.5",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: Assets.muliRegular,
                                                  color: AppColors.clr_bg_grey,
                                                )
                                            )
                                          ],
                                        )


                                    )
                                  ],
                                ),
                                Text(
                                    "Waiter . Wed, Sep 23",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
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
                    ],
                  )
              )
            ]),
      ),
    );
  }
}