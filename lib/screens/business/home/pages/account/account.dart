import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.height * 0.9,
        width: AppSizes.width * 0.9,
        color: AppColors.clr_bg,
        padding: EdgeInsets.all(AppSizes.height*0.015),
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
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: AppSizes.width * 0.55,
                              child: Text(
                                  "Edit",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
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
                              fontFamily: Assets.muliBold,

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
                      width: AppSizes.width * 0.85,
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
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "Fusce maximus cursus lectus, varius ultricies erat molestie vel. Fusce sapien urna, rhoncus et tempor vel, placerat eu velit. Pellentesque nec felis pulvinar, luctus lectus eget!",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.clr_bg_grey,
                      fontFamily: Assets.muliRegular,
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
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: AppColors.clr_bg_grey))
              ),
                width: AppSizes.width * 0.85,
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
                            fontFamily: Assets.muliSemiBold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
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
                            fontFamily: Assets.muliSemiBold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
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
                            fontFamily: Assets.muliSemiBold,
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

            Container(
              margin: EdgeInsets.only(top: AppSizes.height*0.015),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1,color: AppColors.clr_bg_grey))
                ),
                width: AppSizes.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Info",style: TextStyle(
                      color: AppColors.clr_bg_black,fontSize: 22,
                      fontFamily: Assets.muliBold
                    ),),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),
                    Row(
                      children: [
                       Image.asset(Assets.sign,height: 25,width: 25,),
                        SizedBox(
                          width: AppSizes.width*0.02,
                        ),
                        Text(
                          "Document Verification",
                          style: TextStyle(
                            fontFamily: Assets.muliSemiBold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),
                    Row(
                      children: [
                        Image.asset(Assets.card,height: 25,width: 25,),
                        SizedBox(
                          width: AppSizes.width*0.02,
                        ),
                        Text(
                          "Card Details",
                          style: TextStyle(
                            fontFamily: Assets.muliSemiBold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),
                    Row(
                      children: [
                        Image.asset(Assets.payment,height: 25,width: 25,),
                        SizedBox(
                          width: AppSizes.width*0.02,
                        ),
                        Text(
                          "Payments",
                          style: TextStyle(
                            fontFamily: Assets.muliSemiBold,
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

            Container(
              margin: EdgeInsets.only(top:AppSizes.height*0.015),
                width: AppSizes.width * 0.85,
                child: Text(
                    "Completed Jobs",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.clr_bg_black,
                        fontFamily: Assets.muliBold
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
                      fontFamily: Assets.muliSemiBold,
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
                        fontSize: 20,
                        color: AppColors.clr_bg_black,
                        fontFamily: Assets.muliBold
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
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Waiter",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Assets.muliRegular,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Bartender",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Assets.muliRegular,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Barista",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Assets.muliRegular,
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.08,
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Receptionist",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Assets.muliRegular,
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
                      fontSize: 20,
                      color: AppColors.clr_bg_black,
                      fontFamily: Assets.muliBold,
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
                        fontFamily: Assets.muliSemiBold,
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
                              fontFamily: Assets.muliRegular,
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
                        fontFamily: Assets.muliSemiBold,
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
                              fontFamily: Assets.muliRegular,
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
                        fontFamily: Assets.muliSemiBold,
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
                            "6",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Assets.muliSemiBold,
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
