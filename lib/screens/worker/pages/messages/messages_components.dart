import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/models/api_models/job_messages/get_all_user_messages.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';

class MessageComponents{

  Widget getMessageThread({@required GetAllUserMessages msgObj ,@required Function onPress,@required String imagePath,@required String heading,@required String subHeading,@required String imagePath1,@required String rating,}){
    return Expanded(
      child: ListView.builder(
        itemCount: msgObj.data.length,
        itemBuilder: (context, index)
        {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, SlideRightRoute(page: ChatScreen(jobId: msgObj.data[index].jobID, appBarName: msgObj.data[index].companyName,)));
            },
            child: Container(
              margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03),
              height: AppSizes.height * 0.12,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 0.5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.clr_white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(imagePath),
                  SizedBox(
                    width: AppSizes.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                              msgObj.data[index].companyName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontFamily: 'MuliBold',
                              )
                          ),
                          SizedBox(
                            width: AppSizes.width * 0.02,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40),
                              padding: EdgeInsets.all(3.0),
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
                                      imagePath1,
                                      width: 10,
                                      height: 10),
                                  SizedBox(
                                    width: AppSizes.width * 0.04,
                                  ),
                                  Text(
                                      rating,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 12,
                                        fontFamily: Assets
                                            .muliRegular,
                                        color: AppColors
                                            .clr_bg_black,
                                      )
                                  )
                                ],
                              )


                          )
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.022,
                      ),
                      Text(
                          msgObj.data[index].jobName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
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
          );
        },
      ),
    );
  }
}