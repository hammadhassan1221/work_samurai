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

  Widget getOffers(BuildContext context){
    return Container(
        child: ListView(
          children: [
            Container(
                width: AppSizes.width*0.9,
                child: Column(
                  children: [
                    Container(
                        width: AppSizes.width*0.9,
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
                              height: AppSizes.height*0.18,
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
                                            height: AppSizes.height*0.01,
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
                                            icon: Icon(Icons.arrow_forward_ios),
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
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color:AppColors.clr_bg_black,
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
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color:AppColors.clr_green,
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
                      height: AppSizes.height*0.02,
                    ),
                    Container(
                        width: AppSizes.width*0.9,
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
                              height: AppSizes.height*0.18,
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
                                            height: AppSizes.height*0.01,
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
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color:AppColors.clr_bg_black,
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
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color:AppColors.clr_green,
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
                      height: AppSizes.height*0.04,
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
                      height: AppSizes.height*0.02,
                    ),
                    Container(
                        width: AppSizes.width*0.9,
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
                              height: AppSizes.height*0.18,
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
                                            height: AppSizes.height*0.01,
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
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color:AppColors.clr_bg_black,
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
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color:AppColors.clr_green,
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

  void _newTaskModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              )
            ),
            child: ListView(
              children: [
                
              ],
            )
          );
        }
    );
  }

  Widget getInProgress(){
    return Container(
        child: Column(
          children: [
            Container(
              height: AppSizes.height*0.4,
              width: AppSizes.width*0.9,
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
                    height: AppSizes.height*0.18,
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
                                  height: AppSizes.height*0.01,
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
                    padding: EdgeInsets.only(right: 10.0, left:10.0),
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
                              width: AppSizes.width*0.02,
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

  Widget getConfirmed(){
    Container(
        child: Column(
          children: [
            Container(
                width: AppSizes.width*0.9,
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
                      height: AppSizes.height*0.18,
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
                                    height: AppSizes.height*0.01,
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
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                    right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:10.0,bottom:10.0),
                                width: AppSizes.width*0.44,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color:AppColors.clr_red,
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
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:4.0,bottom:10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width*0.44,
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
              height: AppSizes.height*0.02,
            ),
            Container(
                width: AppSizes.width*0.9,
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
                      height: AppSizes.height*0.18,
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
                                    height: AppSizes.height*0.01,
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
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                    right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:10.0,bottom:10.0),
                                width: AppSizes.width*0.44,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color:AppColors.clr_red,
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
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:4.0,bottom:10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width*0.44,
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

  Widget getOffersContainer(BuildContext context){
    return Container(
        child: ListView(
          children: [
            Container(
                width: AppSizes.width*0.9,
                child: Column(
                  children: [
                    Container(
                        width: AppSizes.width*0.9,
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
                              height: AppSizes.height*0.18,
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
                                            height: AppSizes.height*0.01,
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
                                            onPressed: (){
                                              _newTaskModalBottomSheet(context);
                                            },
                                            icon: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
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
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color:AppColors.clr_bg_black,
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
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color:AppColors.clr_green,
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
                      height: AppSizes.height*0.02,
                    ),
                    Container(
                        width: AppSizes.width*0.9,
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
                              height: AppSizes.height*0.18,
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
                                            height: AppSizes.height*0.01,
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
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color:AppColors.clr_bg_black,
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
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color:AppColors.clr_green,
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
                      height: AppSizes.height*0.04,
                    ),
                    _container(),
                    SizedBox(
                      height: AppSizes.height*0.02,
                    ),
                    Container(
                        width: AppSizes.width*0.9,
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
                              height: AppSizes.height*0.18,
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
                                            height: AppSizes.height*0.01,
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
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                            right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.clear,
                                              color:AppColors.clr_bg_black,
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
                                        padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: AppSizes.width*0.44,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color:AppColors.clr_green,
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

  _container(){
    return  Container(
      alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 20.0),
        child: Text(
          "Apply",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.clr_bg_black,
          ),
        )
    );
  }

  Widget getInProgressContainer(){
    return Container(
        child: Column(
          children: [
            Container(
              height: AppSizes.height*0.4,
              width: AppSizes.width*0.9,
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
                    height: AppSizes.height*0.18,
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
                                  height: AppSizes.height*0.01,
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
                    padding: EdgeInsets.only(right: 10.0, left:10.0),
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
                              width: AppSizes.width*0.02,
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

  Widget getConfirmedContainer(){
    return  Container(
        child: Column(
          children: [
            Container(
                width: AppSizes.width*0.9,
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
                      height: AppSizes.height*0.18,
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
                                    height: AppSizes.height*0.01,
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
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                    right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:10.0,bottom:10.0),
                                width: AppSizes.width*0.44,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color:AppColors.clr_red,
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
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:4.0,bottom:10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width*0.44,
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
              height: AppSizes.height*0.02,
            ),
            Container(
                width: AppSizes.width*0.9,
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
                      height: AppSizes.height*0.18,
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
                                    height: AppSizes.height*0.01,
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
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                    right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:10.0,bottom:10.0),
                                width: AppSizes.width*0.44,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color:AppColors.clr_red,
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
                                padding: EdgeInsets.only(left:15.0, right:10.0, top:4.0,bottom:10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                  ),
                                  color: Colors.white,
                                ),
                                width: AppSizes.width*0.44,
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

}