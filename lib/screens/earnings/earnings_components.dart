import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';


class EarningComponents{
  Widget getDateContainer({@required Function onPress,@required BuildContext context,@required IconData iconData,@required String fromDate,}){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: AppSizes.height*0.02),
        padding: EdgeInsets.all(AppSizes.width*0.03),
        decoration: BoxDecoration(
          color: AppColors.clr_bg,
          /*boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
              Icon(iconData),
                SizedBox(width: AppSizes.width*0.025,),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: Colors.black,
                          width: 0.5, // This would be the width of the underline
                        ))),
                    padding: EdgeInsets.only(top: AppSizes.height*0.01,bottom: 1),
                    child: Text(
                        fromDate.isNotEmpty ? '$fromDate' : "Select Date",
                        style: TextStyle(fontSize: 13),),
                  ),
                )
            ],),
           // SizedBox(width: AppSizes.width*0.01,)
          ],
        ),
      ),
    );
  }

  Widget getJobContainer({@required String text, @required String amount}){
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: AppColors.clr_field,
              width: 1.5, // This would be the width of the underline
            ))),
        padding: EdgeInsets.only(top: AppSizes.height*0.01,bottom: AppSizes.width*0.025),
      margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: TextStyle(fontSize: 20,fontFamily: "MuliSemiBold"),),
          Text(amount,style: TextStyle(fontSize: 20,fontFamily: "MuliSemiBold"),),

        ],
      )
    );
  }

  Widget getAmountContainer({@required String amount}){
    return Container(
      width: AppSizes.width,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: AppColors.clr_field,
              width: 1.5, // This would be the width of the underline
            ))),
        padding: EdgeInsets.only(top: AppSizes.height*0.01,bottom: AppSizes.width*0.025),
        margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04,top: AppSizes.height*0.025),
        child: Text(amount,style: TextStyle(fontSize: 20,fontFamily: "MuliSemiBold"),)
    );
  }

}