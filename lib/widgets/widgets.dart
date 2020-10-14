import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class CommonWidgets{
  static Widget getRow(String text, bool value, Function onPress){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     Text(text,
       style: TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.w600,
           color:Colors.black,
       ),),

     Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
         Text("All day",style:TextStyle(
          color: AppColors.clr_bg_black,
           fontSize: 14,
         )),
         Container(
           width: AppSizes.width*0.11,
           height: AppSizes.height*0.03,
           margin: EdgeInsets.all(12),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: AppColors.clr_bg_grey
           ),
           child: Stack(
             children: [
               Align(
                 alignment:Alignment.centerLeft,
                 child: Container(
                   height: AppSizes.height*0.03,
                   width: AppSizes.width*0.04,
                   margin: EdgeInsets.only(left:AppSizes.width*0.01,right: AppSizes.width*0.01),
                   decoration: BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle
                   ),
                 ),
               )
             ],
           ),
         ),
       ],
     )
      ],
    );
  }

  static Widget getAvailability(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.height*0.05,
              width: AppSizes.width*0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.clr_green,
              ),
            ),
            SizedBox(width: AppSizes.width*0.03,),
            Text("Available From",
              style: TextStyle(
                  color: AppColors.clr_green,
                  fontSize: 16),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("10:00am",style: TextStyle(fontSize: 16,color: AppColors.clr_green),)],
        ),
      ],
    );
  }

  static Widget getAvailability2(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: AppSizes.height*0.05,
              width: AppSizes.width*0.03,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.clr_bg_black,
              ),
            ),
            SizedBox(width: AppSizes.width*0.03,),
            Text(text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 16),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("5:00pm",style: TextStyle(fontSize: 16,color: AppColors.clr_bg_black),)],
        ),
      ],
    );
  }
}