import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class AlertsComponents{
  Widget getAlerts(){
    return Container(
        child: Center(
        child: Text("Pending on API"),
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
      margin: EdgeInsets.symmetric(horizontal: AppSizes.width * 0.05, vertical: AppSizes.height * 0.005),
      padding: EdgeInsets.all(AppSizes.width * 0.02),
      width: AppSizes.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500].withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(leftIcon),
                radius: 25.0,
                // foregroundColor: AppColors.white,
                // backgroundColor: AppColors.yellow,
              ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                          fontSize: 12,
                          // fontFamily: Assets.poppinsRegular,
                          // color: AppColors.colorBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 10,
                        // fontFamily: Assets.poppinsLight,
                        // color: AppColors.colorBlack,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.height * 0.01),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 10,
                // fontFamily: Assets.poppinsLight,
                // color: AppColors.colorBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}