import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class AlertsComponents {
  Widget time(@required text){
    return  Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top:20, left: 20),
      child: Text(
        text,
        style:TextStyle(
          color: Colors.blueGrey,
          fontFamily: Assets.muliRegular,
          fontSize: 13
        ),
      ),
    );
}

  Widget getNotificationsContainer({
    @required String leftIcon,
    @required String userName,
    @required String message,
    @required String time,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSizes.width * 0.00,
          vertical: AppSizes.height * 0.00),
      padding: EdgeInsets.only(top: AppSizes.width * 0.03, left: AppSizes.width*0.05, bottom: AppSizes.width*0.03),
      width: AppSizes.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          //

     ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(leftIcon),
                radius: 30.0,
                // foregroundColor: AppColors.white,
                // backgroundColor: AppColors.yellow,
              ),
              SizedBox(
                width: AppSizes.width * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: AppSizes.width * 0.5,
                          child: Text(
                            userName,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: Assets.muliSemiBold,
                                fontSize: 17,
                                // fontFamily: Assets.poppinsRegular,
                                // color: AppColors.colorBlack,
                                // fontWeight: FontWeight.bold
    ),
                          ),
                        ),
                        // Container(
                        //   width: AppSizes.width * 0.3,
                        //   child: Text(
                        //     time,
                        //     maxLines: 1,
                        //     style: TextStyle(
                        //       fontSize: 10,
                        //       // fontFamily: Assets.poppinsLight,
                        //       // color: AppColors.colorBlack,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),

                    Container(
                      width: AppSizes.width * 0.68,
                      child: Text(
                        message,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10,
                          // fontFamily: Assets.poppinsLight,
                          // color: AppColors.colorBlack,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
