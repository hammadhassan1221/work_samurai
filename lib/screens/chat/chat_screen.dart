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
        resizeToAvoidBottomInset: true,
        //resizeToAvoidBottomPadding: true,
        body: Container(
          color: AppColors.clr_bg,
          height: AppSizes.height,
          width: AppSizes.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonWidgets.getAppBar(text: "Chat with Crown Hotel", onPress: (){Navigator.pop(context);}, imagepath: Assets.barArrow),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: AppSizes.height * 0.125,
                      padding: EdgeInsets.all(AppSizes.width*0.03),
                      margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,top: AppSizes.height*0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.clr_bg_grey),
                          color: AppColors.clr_bg),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(Assets.support),
                          SizedBox(
                            width: AppSizes.width * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Waiter",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'MuliBold',
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              SizedBox(height: AppSizes.height*0.01,),
                              Text("Wed, Sep 23 11:00am - 1:00pm",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                    fontFamily: 'MuliRegular',
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
                            padding: EdgeInsets.all(10),
                            width: AppSizes.width*0.60,
                            decoration: BoxDecoration(
                                color: AppColors.clr_bg_grey,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text(
                              "Morbi pretium, massa non ornare fringilla, odio eros euismod nibh, venenatis commodo orci diam in sapien. Curabitur ut massa odio.",
                              style: TextStyle(
                                letterSpacing: 0.15,
                                fontSize: 15,
                                fontFamily: 'MuliRegular'
                              ),),
                          ),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Container(
                            margin: EdgeInsets.all(12),

                            padding: EdgeInsets.all(10),
                            width: AppSizes.width*0.25,
                            decoration: BoxDecoration(
                                color: AppColors.clr_bg_grey,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text("Aliquam!",
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.25,
                                  fontFamily: 'MuliRegular'
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
                                  fontFamily: 'MuliRegular',
                                fontSize: 14
                              ),),
                          ),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Container(
                            margin: EdgeInsets.only(right: AppSizes.width*0.04),

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
                                  fontFamily: 'MuliRegular',
                                fontSize: 14,
                              ),),
                          ),
                        ]
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.bottomLeft ,
                  color: AppColors.clr_field,
                  child: Container(
                    height: AppSizes.height*0.06,
                    width: AppSizes.width/1.3,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.only(left:AppSizes.width*0.03),
                    decoration: BoxDecoration(
                        color: AppColors.clr_white,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                          hintStyle: TextStyle(fontSize: 14,fontFamily: 'MuliRegular',fontStyle: FontStyle.italic)
                      ),
                    ),)
                /*Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _textFieldContainer(),
                      Icon(Icons.attach_file),

                      Icon(Icons.send),
                    ],
                  )*/
              ),
            ],
          ),
        )
      )
    );
  }

  _textFieldContainer(){
    return Container(
      height: AppSizes.height*0.06,
      width: AppSizes.width/1.3,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.clr_white,
          borderRadius: BorderRadius.circular(6)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        hintText: "Type your message...",
          hintStyle: TextStyle(fontSize: 14,fontFamily: 'MuliRegular')
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
