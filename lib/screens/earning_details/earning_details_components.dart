

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

class EarningDetailsComponents{
  Widget getPayment({@required BuildContext buildContext,@required String jobDesc,@required String job,@required Function onPress,@required String value}) {
    return
      GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.clr_bg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(AppSizes.width*0.03,),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0,0), // changes position of shadow
                      ),
                    ],
                    color: AppColors.clr_white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.clr_bg_black,
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'MuliSemiBold'
                        )),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),

                    Text(jobDesc,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 0.09,
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: AppColors.pay_field,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'MuliRegular'
                        )),

                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text("Price :",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.clr_bg_black2,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,

                                fontFamily: 'MuliRegular'
                            )),
                        Text(value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,

                                fontFamily: 'MuliSemiBold'
                            )),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget getHeading(){
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),

        child: Text("Earnings",style: TextStyle(
          fontSize: 15,
          decoration: TextDecoration.none,
          fontFamily: "MuliSemiBold",
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
        ),
      ),
    );
  }
}