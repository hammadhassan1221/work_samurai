import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/payment_history/tab_bar_view/daily_payments/payment_details.dart';

class DailyComponents{
  Widget getDailyPayment(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          Navigator.push(context, SlideRightRoute(page:PaymentDetails()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.clr_field,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.clr_white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Waiter in Hotel",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.clr_bg_black,
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          fontFamily: Assets.muliBold,
                        )),
                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),

                    Text("We are a very well reputed hotel and on immediate bases I need waiter for the event.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          letterSpacing: 0.09,
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          color: AppColors.clr_bg_grey,
                          fontFamily: Assets.muliRegular,
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
                              color: AppColors.clr_bg_grey,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontFamily: Assets.muliRegular,
                            )),
                        Text(" \$2000",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.clr_bg_black,
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              fontFamily: Assets.muliRegular,
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