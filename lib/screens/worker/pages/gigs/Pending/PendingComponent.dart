import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/spacer.dart';
class PendingComponent{
  Widget _getHeading({String jobTitle}){
    return  Container(
      width: AppSizes.width/1.3,
      child: Text(
        '$jobTitle',
        style: TextStyle(
          fontSize: AppSizes.fontRatio*18,
          fontFamily: "MuliSemiBold",
          color: AppColors.clr_bg_black,
        ),
      ),
    );
  }

  Widget getSingleContainer({
    BuildContext context,
    String jobTitle,
    String dateTime,
    String location,
    double totalAmount,
    double amountHour,
    Function acceptJob,
    Function rejectJob,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.clr_field,
        ),
        color: AppColors.clr_white,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(5.0,),
      ),
      child: Column(
        children: [
          verticalSpacer(8.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(
                8.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getHeading(jobTitle: jobTitle),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.clr_bg_black2,
                ),
              ],
            ),
          ),
          verticalSpacer(8.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(
                8.0,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              '$dateTime',
              style: TextStyle(
                fontSize: 12,
                fontFamily: "MuliRegular",
                color: AppColors.clr_bg_black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(
                8.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '\$' + '$totalAmount',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "MuliSemiBold",
                    color: AppColors.clr_bg_black,
                  ),
                ),
              ],
            ),
          ),
          verticalSpacer(4.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(
                8.0,
              ),
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '\$' + '$amountHour' + '/h',
              style: TextStyle(
                fontSize: 12,
                fontFamily: "MuliRegular",
                color: AppColors.clr_bg_black,
              ),
            ),
          ),
          verticalSpacer(4.0),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue(
                8.0,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              '$location',
              style: TextStyle(
                fontSize: 12,
                fontFamily: "MuliRegular",
                color: AppColors.clr_bg_black,
              ),
            ),
          ),
          verticalSpacer(8.0),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.clr_field,
          ),
        ],
      ),
    );
  }

}