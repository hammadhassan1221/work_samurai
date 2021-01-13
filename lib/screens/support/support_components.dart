import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class SupportComponents {
  Widget getSupportContainer(
      {@required String imagePath,
      @required String heading,
      @required String title}) {
    return Container(
      margin: EdgeInsets.only(
          left: AppSizes.width * 0.03, right: AppSizes.width * 0.03),
      height: AppSizes.height * 0.12,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: AppColors.clr_bg,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.clr_bg_grey,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
          ),
          SizedBox(
            width: AppSizes.width * 0.03,
          ),
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    color: AppColors.clr_bg_black,
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontFamily: 'MuliBold',
                  ),
                ),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.clr_bg_black2,
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontFamily: 'MuliRegular',
                  ),
                ),
              ],
            ),
          SizedBox(width: AppSizes.width*0.35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          )
        ],

      ),
    );
  }
}
