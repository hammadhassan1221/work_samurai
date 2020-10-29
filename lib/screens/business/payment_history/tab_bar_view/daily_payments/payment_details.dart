import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Stack(
          children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppSizes.height * 0.09,
                  width: AppSizes.width,
                  color: AppColors.clr_white,

                  padding: EdgeInsets.all(AppSizes.width * 0.042),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Image.asset(Assets.barArrow,height: 20,width: 20,)),

                      SizedBox(
                        width: AppSizes.width * 0.02,
                      ),
                      Text(
                        "Payment History",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 22,
                            fontFamily: Assets.muliBold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: AppSizes.width*0.04,right: AppSizes.width*0.04,top: AppSizes.height*0.02),
                  child: Text("Job Title",style: TextStyle(
                      color: AppColors.clr_bg_black,
                      fontFamily: Assets.muliBold,
                      fontSize: 20
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: AppSizes.width*0.04,right: AppSizes.width*0.04,top: AppSizes.height*0.02),
                  child: Text("Waiter in Hotel",style: TextStyle(
                      color: AppColors.sign_field,
                      fontFamily: Assets.muliRegular,
                      fontSize: 15
                  ),),
                ),

                Container(
                  margin: EdgeInsets.only(left: AppSizes.width*0.04,right: AppSizes.width*0.04,top: AppSizes.height*0.02),
                  child: Text("Job Description",style: TextStyle(
                      fontFamily: Assets.muliBold,
                      fontSize: 20
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: AppSizes.width*0.04,right: AppSizes.width*0.04,top: AppSizes.height*0.02),
                  child: Text("Donec dapibus mauris id odio ornare tempus amet accumsan justo, quis tempor ligula. Qui haretra felis. Ut quis consequat orci, at conseq Suspendisse auctor laoreet placerat. Nam et r lacus dignissim lacinia sit amet nec eros. Null quis libero pharetra varius. Nulla tellus nunc, ada at scelerisque eget, cursus at eros. Maec ntesque lacus quis erat eleifend sagittis. Sed v us ante, quis mattis neque. Nullam dapibus er ulla cursus accumsan. Nulla volutpat libero la natis sodales. Ut in pellentesque velit.",style: TextStyle(
                      color: AppColors.sign_field,
                      fontFamily: Assets.muliRegular,
                      fontSize: 15
                  ),),
                ),

                Container(
                  margin: EdgeInsets.only(left: AppSizes.width*0.04,right: AppSizes.width*0.04,top: AppSizes.height*0.02),
                  child: Text("Job Payment",style: TextStyle(
                      fontFamily: Assets.muliBold,
                      fontSize: 20
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: AppSizes.width*0.04,right: AppSizes.width*0.04,top: AppSizes.height*0.02),
                  child: Text("Price: \$2000",style: TextStyle(
                      color: AppColors.sign_field,
                      fontFamily: Assets.muliRegular,
                      fontSize: 15
                  ),),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                child: CommonWidgets.getButton(backgroundColor: AppColors.clr_bg_black, borderColor: AppColors.transparentColor, textColor: AppColors.clr_white, text: "Download pdf", onPress: (){}))
          ]
        ),
      ),
    ));
  }
}
