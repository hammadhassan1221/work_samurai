import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class WorkerCmoponents{
  Widget getProfile(){
    return Container(
        height: AppSizes.height*0.95,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
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
                width: AppSizes.width*0.85,
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
}