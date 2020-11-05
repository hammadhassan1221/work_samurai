import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/home/pages/messages_chat/messages.dart';
class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
         margin: EdgeInsets.all(15),
          // margin: EdgeInsets.only(left: AppSizes.width*0.06,right:AppSizes.width*0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.clr_white,
                margin: EdgeInsets.only(top:AppSizes.height*0.02),
                child: Text("Book Your Samurai",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: Assets.muliBold,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),),
              ),

              Expanded(
                child: ListView(
                  children: [

                    Container(
                      margin: EdgeInsets.only(top:AppSizes.height*0.04),
                      padding: EdgeInsets.all(10),
                      height: AppSizes.height*0.10,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.clr_bg_grey),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Location",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 12,fontFamily: Assets.muliRegular),),
                          SizedBox(
                            height: AppSizes.height*0.01,
                          ),
                          Text("Crown Hotel, New York",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:AppSizes.height*0.04),
                      padding: EdgeInsets.all(10),
                      height: AppSizes.height*0.10,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.clr_bg_grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Category Of Worker",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 12,fontFamily: Assets.muliRegular),),
                                  SizedBox(
                                    height: AppSizes.height*0.01,
                                  ),
                                  Text("Hospitality",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),)

                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.keyboard_arrow_down,color: AppColors.clr_bg_black,)
                            ],
                          )
                        ],
                      )
                    ),
                    Container(
                        margin: EdgeInsets.only(top:AppSizes.height*0.04),
                        padding: EdgeInsets.all(10),
                        height: AppSizes.height*0.10,
                        width: AppSizes.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.clr_bg_grey),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Positioned needed",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 12,fontFamily: Assets.muliRegular),),
                                    SizedBox(
                                      height: AppSizes.height*0.01,
                                    ),
                                    Text("Waiter",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),)

                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.keyboard_arrow_down,color: AppColors.clr_bg_black,)
                              ],
                            )
                          ],
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(top:AppSizes.height*0.04),
                      padding: EdgeInsets.all(10),
                      height: AppSizes.height*0.10,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.clr_bg_grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Number of Workers",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 12,fontFamily: Assets.muliRegular),),
                          SizedBox(
                            height: AppSizes.height*0.01,
                          ),
                          Text("2",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),)
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top:AppSizes.height*0.04),
                      padding: EdgeInsets.all(20),
                      height: AppSizes.height*0.10,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.clr_bg_grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Hourly rate",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),),
                    ),
                    Container(
                        margin: EdgeInsets.only(top:AppSizes.height*0.04),
                        padding: EdgeInsets.all(10),
                        height: AppSizes.height*0.10,
                        width: AppSizes.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.clr_bg_grey),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Date",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(Assets.time,height: 25,width: 25,)
                              ],
                            )
                          ],
                        )
                    ),

                    Container(
                      margin: EdgeInsets.only(top:AppSizes.height*0.04),
                      padding: EdgeInsets.all(20),
                      height: AppSizes.height*0.10,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.clr_bg_grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Time",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:AppSizes.height*0.04),
                      padding: EdgeInsets.all(20),
                      height: AppSizes.height*0.10,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.clr_bg_grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("No. of hours",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: Assets.muliRegular),),
                    ),

                    Container(
                        margin: EdgeInsets.only(top:AppSizes.height*0.01),
                        padding: EdgeInsets.all(10),
                        height: AppSizes.height*0.10,
                        width: AppSizes.width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                          )
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 18,fontFamily: Assets.muliBold),),
                            Text("\$35",style: TextStyle(color: AppColors.clr_bg_black,fontSize: 18,fontFamily: Assets.muliBold),),
                          ],
                        )
                    ),

                    Container(
                        margin: EdgeInsets.only(top:AppSizes.height*0.01),
                        padding: EdgeInsets.all(10),
                        height: AppSizes.height*0.10,
                        width: AppSizes.width,

                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Automatically select workers for me",
                              style: TextStyle(
                                  color: AppColors.clr_bg_black,
                                  fontSize: 15,
                                  fontFamily: Assets.muliRegular),),
                           CupertinoSwitch(

                              activeColor: AppColors.clr_green,
                              value: isEnabled,
                              onChanged: (bool value) { setState(() { isEnabled = value; }); },
                            ),
                          ],
                        )
                    ),

                    GestureDetector(
                      onTap: (){Navigator.push(context, SlideRightRoute(page: BusinessChatRoom()));},
                      child: Container(
                        margin: EdgeInsets.only(top:AppSizes.height*0.01),
                        padding: EdgeInsets.all(16),
                        height: AppSizes.height*0.08,
                        width: AppSizes.width,
                        decoration: BoxDecoration(
                          color: AppColors.clr_bg_black,
                            border: Border.all(color: AppColors.clr_bg_grey),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text("Confirm",style: TextStyle(color: AppColors.clr_white,fontSize: 16,fontFamily: Assets.muliRegular),textAlign: TextAlign.center,),
                      ),
                    )



                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
