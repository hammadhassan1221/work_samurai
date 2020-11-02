import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class AccountComponent {
  Widget getDocumentDetails({@required String text}) {
    return Row(
      children: [
        Icon(
          Icons.check,
          size: 12,
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

  Widget getUserEdit({@required String imagePath,@required String text}) {
    return Container(
        child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Image.asset(
            imagePath,
            height: 100,
            width: 100,
          ),
        ),
        Container(
            width: AppSizes.width * 0.55,
            height: AppSizes.height / 8,
            padding: EdgeInsets.only(top: AppSizes.height * 0.03),
            child: Text(text,
                textAlign: TextAlign.right,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  fontFamily: 'MuliBold',
                )))
      ],
    ));
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
        width: AppSizes.width * 0.85,
        child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
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
                      color: AppColors.clr_bg_grey,
                    )
                ),
                child: Text(
                    rating,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_grey,
                    )
                )
            ),
          ],
        )
    );
  }
}
