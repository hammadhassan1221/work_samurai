import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class AccountComponent {
  Widget getDocumentDetails({@required String text}) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: 14,
          color: AppColors.clr_green,
        ),
        SizedBox(
          width: AppSizes.width * 0.05,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: Assets.muliRegular,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: AppSizes.height * 0.01,
        ),
      ],
    );
  }

  Widget getUserEdit({@required String imagePath,@required String text,@required Function onPress, @required String imagePath1}) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  image: DecorationImage(
                    image: imagePath != null  ? NetworkImage(
                      imagePath,
                    ) : AssetImage( Assets.dp),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle
              ),
              margin: EdgeInsets.only(top: AppSizes.height*0.08),
            ),
            Row(


              children: [
                Container(margin: EdgeInsets.only(bottom: AppSizes.height*0.1,),child: Image.asset(imagePath1,height: 25,width: 25,)),
                SizedBox(width: AppSizes.width*0.0125,),
                GestureDetector(
                    onTap: onPress,
                    child: Container(
                      margin: EdgeInsets.only(bottom: AppSizes.height*0.105),
                      alignment: Alignment.topRight,
                      decoration : BoxDecoration(
                        border: Border(
                            bottom: BorderSide( color: AppColors.clr_bg_black)
                        ),
                      ),
                      child: Text(text,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontSize: 18,
                            fontFamily: Assets.muliBold,
                          )),
                    )),
              ],
            ),
          ],
        ));
  }

  Widget getVerification({@required Function onPress,@required String text,@required String imagePath}){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onPress,
              child: Row(
                children: [
                  Image.asset(imagePath,height: 25,width: 25,),
                  SizedBox(
                    width: AppSizes.width*0.045,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: Assets.muliSemiBold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.height * 0.015,
            ),
          ],
        )
    );

  }

  Widget getUserDetails({@required String text}){
    return Container(
        width: AppSizes.width * 0.85,
        child: Text(
            text ?? "addressline not available",
            style: TextStyle(
              fontSize: 13,
              color: AppColors.clr_bg_black2,
              fontFamily: Assets.muliRegular,
                fontStyle: FontStyle.italic
            )
        )
    );
  }

  Widget getHeadings({@required String text}){
    return  Container(
        margin: EdgeInsets.only(top:AppSizes.height*0.015),
        child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.clr_bg_black,
              fontFamily: Assets.muliBold,
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
                fontFamily: Assets.muliSemiBold,
              ),
            ),
            SizedBox(
              width: AppSizes.width * 0.015,
            ),
            Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.clr_bg_black2,
                    )
                ),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top:0),
                  child: Text(
                      rating,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Assets.muliRegular,
                        color: AppColors.clr_bg_black2,
                      )
                  ),
                )
            ),
          ],
        )
    );
  }

  Widget getPositionContainer({@required String text1,@required String text2,@required String text3,@required String text4,}){
    return Container(
        child: Wrap(
          children: [
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text1,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.muliRegular,
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              width: AppSizes.width * 0.028,
            ),
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.muliRegular,
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              width: AppSizes.width * 0.025,
            ),
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text3,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.muliRegular,
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              width: AppSizes.width*0.05,
              height: AppSizes.height * 0.08,
            ),
            Container(
                padding: EdgeInsets.all(10.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.clr_field,
                ),
                child: Text(
                    text4,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: Assets.muliRegular,
                      color: AppColors.clr_bg_black,
                    )
                )
            ),

            SizedBox(
              width: AppSizes.width * 0.025,
            ),

            _getAddPosition(),


          ],
        )
    );
  }

  _getAddPosition(){
    return Container(
        width: AppSizes.width*0.45,
        padding: EdgeInsets.all(10.0,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.clr_field,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.add_circle_outline,color: AppColors.clr_bg_black,size: 18,),
//            SizedBox(width: AppSizes.width*0.015,),
            Text(
                "Add Positions",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: Assets.muliRegular,
                  color: AppColors.clr_bg_black,
                )
            ),
          ],
        )
    );
  }

  Widget getUserRatingCity({@required String name,@required double rating,@required String city,}){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: Assets.muliBold,
                     // fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(
                  width: AppSizes.width * 0.02,
                ),
                Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: AppColors.clr_bg_grey,
                        )
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                            Assets.star,
                            width: 10,
                            height: 10),
                        SizedBox(
                          width: AppSizes.width * 0.015,
                        ),
                      Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: Assets.muliRegular,
                              color: AppColors.clr_bg_black,
                            )
                        )
                      ] ,
                    )
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: AppSizes.width * 0.85,
              child: Text(

                  city ?? "no city selected",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.clr_bg_black2,
                    fontFamily: Assets.muliRegular,
                    fontStyle: FontStyle.italic
                  )
              ),
            ),
          ],
        )
    );
  }
}