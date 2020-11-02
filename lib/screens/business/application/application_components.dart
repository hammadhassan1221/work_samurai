import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/loader.dart';

class ApplicationComponents {
  Widget getApplicants(BuildContext context) {
    return Container(
        width: AppSizes.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.clr_bg_grey),
            color: AppColors.clr_white),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    SlideRightRoute(page: _alertDialogueContainer(context)));
              },
              child: Container(
                padding: EdgeInsets.all(13),
                margin: EdgeInsets.only(bottom: AppSizes.height * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.support,
                          height: 60,
                          width: 60,
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("Michael",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: AppColors.clr_bg_black,
                                      fontFamily: Assets.muliBold,
                                    )),
                                SizedBox(
                                  width: AppSizes.width * 0.03,
                                ),
                                Container(
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.clr_green,
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        border: Border.all(
                                          color: AppColors.clr_bg_grey,
                                        )),
                                    child: Text("1/3",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          fontFamily: Assets.muliRegular,
                                          color: AppColors.clr_bg_grey,
                                        ))),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.002,
                            ),
                            Text("Experience: 4 years",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.clr_bg_grey,
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  fontFamily: Assets.muliSemiBold,
                                )),
                            SizedBox(
                              height: AppSizes.height * 0.002,
                            ),
                            Text("Samurai Jobs:18",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 14,
                                  color: AppColors.clr_bg_grey,
                                  fontFamily: Assets.muliBold,
                                ))
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(width: 1.0, color: AppColors.clr_bg_grey),
              )),
              child: Row(
                children: [

                ],
              ),
            ),
          ],
        ));
  }

  Widget getBusinessProfile() {
    return Container(
      width: AppSizes.width,
      color: AppColors.clr_bg,
      padding: EdgeInsets.all(AppSizes.width * 0.05),
    );
  }

  _alertDialogueContainer(BuildContext context) {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: AppColors.clr_bg_black.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: AppSizes.width * 0.15,
                      ),
                      padding: EdgeInsets.all(
                         AppSizes.height * 0.05,
                      ),
                      height: AppSizes.height * 0.95,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Row(
                            children: [
                              Text("Robert Miller",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 22,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'MuliBold',
                                      color: AppColors.clr_bg_black)),
                              SizedBox(
                                width: AppSizes.width * 0.02,
                              ),
                              Container(
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: AppColors.clr_bg_grey,
                                      )),
                                  child: Row(
                                    children: [
                                      Image.asset(Assets.star,
                                          width: 10, height: 10),
                                      SizedBox(
                                        width: AppSizes.width * 0.015,
                                      ),
                                      Text("4.5",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_bg_grey,
                                          ))
                                    ],
                                  ))
                            ],
                          ),
                          Container(
                            width: AppSizes.width * 0.85,
                            child: Text("New York",
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: AppColors.clr_bg_black,
                                  fontFamily: 'MuliBold',
                                )),
                          ),
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Text(
                                  "Fusce maximus cursus lectus, varius ultricies erat molestie vel. Fusce sapien urna, rhoncus et tempor vel, placerat eu velit. Pellentesque nec felis pulvinar, luctus lectus eget!",
                                  style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color: AppColors.clr_bg_black2,
                                    fontFamily: 'MuliRegular',
                                  ))),
                          SizedBox(
                            height: AppSizes.height * 0.015,
                          ),
                          Container(
                            height: AppSizes.height * 0.001,
                            color: AppColors.clr_bg_grey,
                            width: AppSizes.width,
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.015,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,size: 16,
                                      ),
                                      SizedBox(
                                        width: AppSizes.width*0.05,
                                      ),
                                      Text(
                                        "Work rights verified",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: 'MuliSemiBold',
                                            fontSize: 15,
                                            color: AppColors.clr_bg_black),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,size: 16,
                                      ),
                                      SizedBox(
                                        width: AppSizes.width*0.05,
                                      ),
                                      Text(
                                        "Driver License verified",
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'MuliSemiBold',
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check,size: 16,
                                      ),
                                      SizedBox(
                                        width: AppSizes.width*0.05,
                                      ),
                                      Text(
                                        "Police check",
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'MuliSemiBold',
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                ],
                              )),

                          Container(
                              width: AppSizes.width * 0.85,
                              child: Text("Completed Jobs",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      color: AppColors.clr_bg_black,
                                    fontFamily: 'MuliBold',))),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Text("4",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    fontFamily: 'MuliSemiBold',
                                    color: AppColors.clr_bg_black,
                                  ))),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),

                          Container(
                              width: AppSizes.width * 0.85,
                              child: Text("Positions",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 20,
                                      color: AppColors.clr_bg_black,
                                    fontFamily: 'MuliBold',))),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Wrap(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(
                                        10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: AppColors.clr_field,
                                      ),
                                      child: Text("Waiter",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 15,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_bg_black,
                                          ))),
                                  SizedBox(
                                    width: AppSizes.width * 0.05,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(
                                        10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: AppColors.clr_field,
                                      ),
                                      child: Text("Bartender",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 15,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_bg_black,
                                          ))),
                                  SizedBox(
                                    width: AppSizes.width * 0.05,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(
                                        10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: AppColors.clr_field,
                                      ),
                                      child: Text("Barista",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 15,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_bg_black,
                                          ))),
                                  SizedBox(
                                    width: AppSizes.width * 0.05,
                                    height: AppSizes.height * 0.08,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(
                                        10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: AppColors.clr_field,
                                      ),
                                      child: Text("Receptionist",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 15,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_bg_black,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.03,
                          ),

                          //must move to components for generic
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Text("Compliments",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    color: AppColors.clr_bg_black,
                                    fontFamily: 'MuliBold',
                                  ))),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Row(
                                children: [
                                  Image.asset(Assets.diamond,
                                      height: 25, width: 25),
                                  SizedBox(
                                    width: AppSizes.width * 0.03,
                                  ),
                                  Text(
                                    "Perfect Service",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.clr_bg_black,
                                      fontSize: 15,
                                      fontFamily: 'MuliSemiBold',
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.03,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: AppColors.clr_bg_grey,
                                          )),
                                      child: Text("3",
                                          style: TextStyle(
                                            fontSize: 12,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_bg_grey,
                                          ))),
                                ],
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Row(
                                children: [
                                  Image.asset(Assets.communicate,
                                      height: 25, width: 25),
                                  SizedBox(
                                    width: AppSizes.width * 0.03,
                                  ),
                                  Text(
                                    "Good Communication",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        fontFamily: 'MuliSemiBold',
                                        color: AppColors.clr_bg_black),
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.01,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: AppColors.clr_bg_grey,
                                          )),
                                      child: Text("10",
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 12,
                                            fontFamily: 'MuliSemiBold',
                                            color: AppColors.clr_bg_grey,
                                          ))),
                                ],
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              width: AppSizes.width * 0.85,
                              child: Row(
                                children: [
                                  Image.asset(Assets.muscle,
                                      height: 25, width: 25),
                                  SizedBox(
                                    width: AppSizes.width * 0.03,
                                  ),
                                  Text(
                                    "Hard Worker",
                                    style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: AppColors.clr_bg_black,
                                      fontFamily: 'MuliSemiBold',
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.03,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 5.0, right: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: AppColors.clr_bg_grey,
                                          )),
                                      child: Text("6",
                                          style: TextStyle(
                                            fontSize: 15,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'MuliSemiBold',
                                            color: AppColors.clr_bg_grey,
                                          ))),
                                ],
                              )),

                          Container(
                            width: AppSizes.width,
                            margin: EdgeInsets.only(top: AppSizes.height*0.05,bottom:  AppSizes.height*0.05,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.clr_bg_grey),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.all(AppSizes.width*0.04),

                                      width: AppSizes.width/2.8,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          Icon(
                                            Icons.clear,size: 16,
                                            color: AppColors.clr_bg_black,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.02,),
                                          Text(
                                              "Skip",
                                              style: TextStyle(
                                                  color: AppColors
                                                      .clr_bg_black,
                                                  fontSize: 17,fontFamily: 'MuliRegular'
                                              )
                                          ),
                                        ],
                                      )
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      hideLoader(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: AppColors.clr_bg_grey),
                                          color: Colors.white,
                                        ),
                                    padding: EdgeInsets.all(AppSizes.width*0.04),
                                        width: AppSizes.width/2.8,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Icon(
                                              Icons.clear,size: 16,
                                              color: AppColors.clr_green,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width * 0.02,),
                                            Text(
                                                "Accept",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .clr_green,
                                                    fontSize: 17,fontFamily: 'MuliRegular'
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.10,
                        ),
                        height: AppSizes.width * 0.25,
                        width: AppSizes.width * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(233, 233, 211, 0)),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Image.asset(
                          Assets.support,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
