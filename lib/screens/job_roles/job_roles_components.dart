import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class JobRolesComponents{
  Widget getHeading({@required String text}){
    return Container(
      margin: EdgeInsets.only(top:AppSizes.height*0.02,bottom:AppSizes.height*0.01,left: AppSizes.width*0.03,right: AppSizes.width*0.03),
      child: Text(text,style: TextStyle(
          color: AppColors.clr_bg_black,
          fontFamily: 'MuliSemiBold',
          fontSize: 18
      ),),
    );

  }

  Widget getVerifiedJobRolesContainer(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String job,
        // @required TextEditingController controller,
        @required String verify,
      }) {
    return Container(
        alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: AppSizes.width*0.05,top: AppSizes.width*0.03,bottom:AppSizes.width*0.03,right: AppSizes.width*0.03),
        margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(verify,style: TextStyle(
                  color: AppColors.clr_green,
                  fontFamily: 'MuliRegular',
                  fontSize: 14
                ),),
                Text(job,style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'MuliSemiBold',

                ),),
              ],
            ),
            Icon(Icons.check_circle)
          ],
        ),
    );
  }

  Widget getJobRolesContainer(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String job,
        // @required TextEditingController controller,
        @required String verify,
      }) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: AppSizes.width*0.05,top: AppSizes.width*0.03,bottom:AppSizes.width*0.03,),
      margin: EdgeInsets.only(left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
      ),

      child:Text(job,style: TextStyle(
        fontSize: 22,
        fontFamily: 'MuliSemiBold',

      ),),
    );
  }
}