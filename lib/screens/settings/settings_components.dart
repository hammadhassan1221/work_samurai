import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class SettingsComponents {
  Widget getHeadings(
      {@required String imagePath,
      @required String text,
      @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: AppColors.clr_field,
          width: 1.5, // This would be the width of the underline
        ))),
        padding: EdgeInsets.only(bottom: AppSizes.height * 0.02),
        margin: EdgeInsets.only(
          top: AppSizes.height * 0.035,
          left: AppSizes.width * 0.04,
          right: AppSizes.width * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 25, width: 25),
            SizedBox(
              width: AppSizes.width * 0.02,
            ),
            Container(
              margin: EdgeInsets.only(bottom: AppSizes.height * 0.005),
              child: Text(text,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.clr_bg_black,
                    fontFamily: 'MuliSemiBold',
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget getProfileThread({
    @required Function onPress,
    @required String imagePath,
    @required String heading,
    @required String subHeading,
    @required String iconData,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          top: AppSizes.width * 0.03,
          left: AppSizes.width * 0.03,
          right: AppSizes.width * 0.03,
        ),
        height: AppSizes.height * 0.12,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.clr_field),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: AppColors.clr_bg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.green,
                      width: 3,
                    ),
                  ),
                  image: DecorationImage(
                    image:  NetworkImage(
                      imagePath,
                    ) ,
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle
              ),
             // margin: EdgeInsets.only(top: AppSizes.height*0.08),
            ),
            SizedBox(
              width: AppSizes.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(heading,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.clr_bg_black,
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontFamily: 'MuliBold',
                    )),
                SizedBox(
                  height: AppSizes.height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: AppSizes.height * 0.005),
                      child: Text(subHeading,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.clr_bg_black2,
                            fontFamily: 'MuliRegular',
                          )),
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.0125,
                    ),
                    Icon(
                      Icons.edit,
                      size: 15,
                      color: AppColors.clr_bg_black2,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
