import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class AccountComponent {
  Widget getDocumentDetails({@required String text}) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: 14,
          color: AppColors.clr_green,
        ),
        SizedBox(
          width: AppSizes.width * 0.05,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'MuliSemiBold',
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: AppSizes.height * 0.01,
        ),
      ],
    );
  }

  Widget getUserEdit({@required String imagePath,@required String text,@required Function onPress}) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: AppSizes.height*0.03),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
              ),
            ),
            GestureDetector(
              onTap: onPress,
              child: Container(
                  width: AppSizes.width * 0.6,
                  height: AppSizes.height / 8,
                  child: Text(text,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                       // decoration: TextDecoration.underline,
                        fontSize: 18,
                        fontFamily: 'MuliBold',
                      ))),
            )
          ],
        ));
  }

  Widget getVerification({@required Function onPress,@required String text,@required String imagePath}){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onPress,
              child: Row(
                children: [
                  Image.asset(imagePath,height: 25,width: 25,),
                  SizedBox(
                    width: AppSizes.width*0.045,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'MuliSemiBold',
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.height * 0.015,
            ),
          ],
        )
    );

  }

  Widget getUserDetails({@required String text}){
    return Container(
        width: AppSizes.width * 0.85,
        child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.clr_bg_black2,
              fontFamily: 'MuliRegular',                    )
        )
    );
  }

  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.clr_bg_black,
              fontFamily: 'MuliBold',
            )
        )
    );
  }

  Widget getCompliments({@required String imagePath, @required String compliment,@required String rating }){
    return Container(
        width: AppSizes.width * 0.85,
        child: Row(
          children: [
            Image.asset(imagePath,
                height: 25,
                width: 25),
            SizedBox(
              width: AppSizes.width * 0.03,
            ),
            Text(
              compliment,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'MuliSemiBold',
              ),
            ),
            SizedBox(
              width: AppSizes.width * 0.03,
            ),
            Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.clr_bg_black2,
                    )
                ),
                child: Text(
                    rating,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black2,
                    )
                )
            ),
          ],
        )
    );
  }

  Widget getPositionContainer({@required String text1,@required String text2,@required String text3,@required String text4}){
    return Container(
        child: Wrap(
          children: [
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              width: AppSizes.width * 0.028,
            ),
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              width: AppSizes.width * 0.025,
            ),
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text3,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              width: AppSizes.width*0.05,
              height: AppSizes.height * 0.08,
            ),
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text4,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black,
                    )
                )
            )
          ],
        )
    );
  }

  Widget getUserRatingCity({@required String name,@required String rating,@required String city,}){
    return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'MuliBold,',
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  SizedBox(
                    width: AppSizes.width * 0.02,
                  ),
                  Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.clr_bg_grey,
                          )
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                              Assets.star,
                              width: 10,
                              height: 10),
                          SizedBox(
                            width: AppSizes.width * 0.015,
                          ),
                          Text(
                              rating,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'MuliRegular',
                                color: AppColors.clr_bg_grey,
                              )
                          )
                        ],
                      )
                  )
                ],
              ),
              Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    city,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.clr_bg_black,
                      fontFamily: 'MuliSemiBold',
                    )
                ),
              ),
            ],
          )
      );
  }
}