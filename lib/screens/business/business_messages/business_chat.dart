import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class BusinessMessages extends StatefulWidget {
  @override
  _BusinessMessagesState createState() => _BusinessMessagesState();
}

class _BusinessMessagesState extends State<BusinessMessages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              color: AppColors.clr_bg,
              height: AppSizes.height,
              width: AppSizes.width,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: AppSizes.height * 0.09,
                    width: AppSizes.width,
                    color: AppColors.clr_white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap:(){
                              Navigator.pop(context);},
                              child: Image.asset(Assets.barArrow,height: 20,width: 20,)),
                        SizedBox(
                          width: AppSizes.width * 0.03,
                        ),
                        Text(
                          "Chat with Robert",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: AppColors.clr_bg_black,
                              //fontWeight: FontWeight.w600,
                              fontFamily: Assets.muliBold,
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
                                      Text("Bartender",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Assets.muliBold,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: AppSizes.height*0.01,),
                                  Text("Wed, Sep 23 11:00am - 1:00pm",
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
                  Container(
                    alignment: Alignment.bottomCenter ,
                    child: _textFieldContainer(),
                  ),
                ],
              ),


              /*Positioned(
                right: 0,
                bottom: 0,
                child: _enterButton(),
              ),*/
            )
        )
    );
  }

  _textFieldContainer(){
    return Container(
      height: AppSizes.height*0.07,
      width: AppSizes.width/1.4,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.clr_field,
          borderRadius: BorderRadius.circular(6)
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Type your message",
            hintStyle: TextStyle(fontSize: 14)
        ),
      ),);
  }

  _enterButton(){
    return GestureDetector(
      onTap: (){},
      child: Container(
          height: AppSizes.height*0.07,
          width: AppSizes.width/6,
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.clr_field,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Icon(
            Icons.send,
            color: AppColors.clr_bg_black,
          )),
    );
  }
}
