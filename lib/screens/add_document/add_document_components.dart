import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';


class AddDocumentComponents{
  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left: AppSizes.width*0.03),
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

  Widget getUserInfo({@required Function onPress,@required String text,@required String text1,@required IconData iconData, @required Color colors}){
    return GestureDetector(
      onTap:onPress,
      child: Container(
        height: AppSizes.height*0.1,
        margin: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03,top: AppSizes.width*0.03),
        width: AppSizes.width,
        padding: EdgeInsets.all(AppSizes.width*0.03),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 0.5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: AppColors.clr_bg,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.sign_field),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black2
                  ),),

                Text(
                  text1,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black
                  ),),

              ],
            ),

            Icon(iconData,color: colors,),

          ],
        ),
      ),
    );
  }

  Widget getDescriptionContainer({@required String heading, @required TextEditingController desc}){
    return Container(
      height: AppSizes.height*0.18,
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.sign_field,
          ),
          borderRadius: BorderRadius.circular(5),
          color: AppColors.clr_bg,
        ),
        padding: EdgeInsets.only(left: AppSizes.width*0.03),
        child:TextField(
          cursorColor: AppColors.clr_bg_black2,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          //cursorHeight: 12,
         controller: desc,
          decoration: InputDecoration(
              hintText: heading,
              hintStyle: TextStyle(fontSize: 18,
                color: AppColors.clr_bg_black,
                fontFamily: 'MuliRegular',),
              border: InputBorder.none,
               ),
      ),
    );
  }

  Widget getDottedContainer({@required Function onPress, @required String text}){
    return GestureDetector(
      onTap: onPress,
      child: Center(
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              alignment: Alignment.center,
              height: AppSizes.height*0.18,
              width: AppSizes.width*0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
            ),
              child: Text(text,style: TextStyle(fontSize: 20),),
            ),
          ),
        ),
      ),
    );

}
}