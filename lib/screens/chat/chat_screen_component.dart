import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class ChatComponents{
  Widget getChatContainer(){
    return Container(
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
                  )
                ],
              ),
              Text(
                  "Waiter . Wed, Sep 23,11:00am - 1:00pm",
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
    );
  }
}