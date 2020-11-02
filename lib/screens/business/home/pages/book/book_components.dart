import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class BookComponents {

  Widget getDropDownContainer(
      {@required String heading, @required String subheading, @required imagepath}) {
    return Container(
        margin: EdgeInsets.only(top: AppSizes.height * 0.025),
        padding: EdgeInsets.all(10),
        height: AppSizes.height * 0.09,
        width: AppSizes.width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.clr_bg_grey),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(heading, style: TextStyle(
                        color: AppColors.clr_bg_black2,
                        fontSize: 12,
                        fontFamily: 'MuliRegular'),),

                    Text(subheading, style: TextStyle(
                        color: AppColors.clr_bg_black,
                        fontSize: 16,
                        fontFamily: 'MuliRegular'),)

                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              ],
            )
          ],
        )
    );
  }

  Widget getInfoContainer(
      {@required String Heading, @required String Subheading}) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.height * 0.04),
      padding: EdgeInsets.all(10),
      height: AppSizes.height * 0.09,
      width: AppSizes.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.clr_bg_grey),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Heading, style: TextStyle(color: AppColors.clr_bg_black2,
              fontSize: 12,
              fontFamily: 'MuliRegular'),),

          Text(Subheading, style: TextStyle(color: AppColors.clr_bg_black,
              fontSize: 16,
              fontFamily: 'MuliRegular'),)
        ],
      ),
    );
  }

  Widget getDescription({@required String heading}){
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top:AppSizes.height*0.025),
      padding: EdgeInsets.all(10),
      height: AppSizes.height*0.18,
      width: AppSizes.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.clr_bg_grey),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(heading,style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: 'MuliRegular'),),
        ],
      ),
    );
  }

  Widget getSimpleContainer({@required String heading}){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top:AppSizes.height*0.025),
      padding: EdgeInsets.all(10),
      height: AppSizes.height*0.09,
      width: AppSizes.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.clr_bg_grey),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(heading,style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: 'MuliRegular'),),
        ],
      ),
    );
  }

  Widget getAmountContainer({@required String text,@required String total}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.01),
        padding: EdgeInsets.all(10),
        height: AppSizes.height*0.09,
        width: AppSizes.width,
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
            )
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: TextStyle(color: AppColors.clr_bg_black,fontSize: 18,fontFamily: 'MuliSemiBold'),),
            Text(total,style: TextStyle(color: AppColors.clr_bg_black,fontSize: 18,fontFamily: 'MuliSemiBold'),),
          ],
        )
    );
  }

  Widget getDateContainer({@required String date,@required Image imagepath}){

    return Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.025),
        padding: EdgeInsets.all(10),
        height: AppSizes.height*0.09,
        width: AppSizes.width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.clr_bg_grey),
            borderRadius: BorderRadius.circular(5)
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(date,style: TextStyle(color: AppColors.clr_bg_black,fontSize: 16,fontFamily: 'MuliRegular'),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Assets.time,height: 20,width: 20,)
              ],
            )
          ],
        )
    );
  }
}