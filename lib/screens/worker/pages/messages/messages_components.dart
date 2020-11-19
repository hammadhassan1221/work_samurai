import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class MessageComponents{

  Widget getMessageThread({@required Function onPress,@required String imagePath,@required String heading,@required String subHeading,@required String imagePath1,@required String rating,}){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03),
        height: AppSizes.height * 0.12,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
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
                        heading,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.clr_bg_black,
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontFamily: Assets
                              .muliRegular,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.02,
                    ),
                    Container(
                        padding: EdgeInsets.all(3.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius
                                .circular(12.0),
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
                              width: AppSizes.width * 0.01,
                            ),
                            Text(
                                rating,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12,
                                  fontFamily: Assets
                                      .muliRegular,
                                  color: AppColors
                                      .clr_bg_grey,
                                )
                            )
                          ],
                        )


                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes.height * 0.010,
                ),
                Text(
                    subHeading,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14,
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
  }
}