import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: AppColors.clr_bg,
          height: AppSizes.height,
          width: AppSizes.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: AppSizes.height * 0.09,
                    width: AppSizes.width,
                    color: AppColors.clr_white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(
                          width: AppSizes.width * 0.03,
                        ),
                        Text(
                          "Chat with Crown Hotel",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: AppColors.clr_bg_black,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          height: AppSizes.height * 0.1,
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(12),
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
                                      Text("Crown Hotel",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Assets.muliBold,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: AppSizes.height*0.01,),
                                  Text("Waiter . Wed, Sep 23 11:00am - 1:00pm",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.clr_bg_grey,
                                        fontFamily: Assets.muliRegular,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Container(
                                margin: EdgeInsets.all(12),
                                height: AppSizes.height*0.18,
                                padding: EdgeInsets.all(10),
                                width: AppSizes.width*0.60,
                                decoration: BoxDecoration(
                                    color: AppColors.clr_bg_grey,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text(
                                  "Morbi pretium, massa non ornare fringilla, odio eros euismod nibh, venenatis commodo orci diam in sapien. Curabitur ut massa odio.",
                                  style: TextStyle(
                                    letterSpacing: 0.25,
                                  ),),
                              ),
                            ]
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Container(
                                margin: EdgeInsets.all(12),
                                height: AppSizes.height*0.06,
                                padding: EdgeInsets.all(10),
                                width: AppSizes.width*0.25,
                                decoration: BoxDecoration(
                                    color: AppColors.clr_bg_grey,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("Aliquam!",
                                  style: TextStyle(
                                    letterSpacing: 0.25,
                                  ),),
                              ),
                            ]
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Container(
                                margin: EdgeInsets.all(6),
                                height: AppSizes.height*0.06,
                                padding: EdgeInsets.all(10),
                                width: AppSizes.width*0.25,
                                decoration: BoxDecoration(
                                    color: AppColors.transparentColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("11:03am",
                                  style: TextStyle(
                                    letterSpacing: 0.25,
                                  ),),
                              ),
                            ]
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[
                              Container(
                                margin: EdgeInsets.only(right: AppSizes.width*0.04),
                                height: AppSizes.height*0.11,
                                padding: EdgeInsets.all(10),
                                width: AppSizes.width*0.60,
                                decoration: BoxDecoration(
                                    color: AppColors.clr_bg_black,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("Quisque vulputate sollicitudin dui, nec placerat ante laoreet sit amet.",
                                  style: TextStyle(
                                    color: AppColors.clr_white,
                                    letterSpacing: 0.25,
                                  ),),
                              ),
                            ]
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: _textFieldContainer(),
                )
              ])
        )
      )
    );
  }

  _textFieldContainer(){
    return Container(
      height: AppSizes.height*0.07,
      width: AppSizes.width/1.1,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.clr_field,
          borderRadius: BorderRadius.circular(6)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        hintText: "type your message",
          hintStyle: TextStyle(fontSize: 14)
    ),
    ),);
  }
}
