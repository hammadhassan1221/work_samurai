import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class MonthlyComponents{
  Widget getMonthlyPayment({@required BuildContext buildContext,@required String jobDesc,@required String job,@required Function onPress,@required String value}) {
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
                            fontFamily: 'MuliBold'
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
                                fontFamily: 'MuliRegular'
                            )),
                        Text(value,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.clr_bg_black,
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontFamily: 'MuliRegular'
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

}