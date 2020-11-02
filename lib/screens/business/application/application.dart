import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'application_components.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}



class _ApplicationState extends State<Application> {

  ApplicationComponents _applicationComponents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _applicationComponents = ApplicationComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_field,
          child: Column(
            children: [
              CommonWidgets.getAppBar(text: "Application", onPress: (){
                Navigator.pop(context);
              }, imagepath: Assets.barArrow),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.clr_field,
                          border: Border.all(color: AppColors.clr_bg_grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Bartender",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.clr_bg_black,
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    fontFamily: 'MuliBold',
                                  )),
                              SizedBox(
                                width: AppSizes.width * 0.02,
                              ),
                              Container(
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      color: AppColors.clr_green,
                                      borderRadius: BorderRadius.circular(7.0),
                                      border: Border.all(
                                        color: AppColors.clr_bg_grey,
                                      )),
                                  child: Text("1/3",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontFamily: Assets.muliRegular,
                                        color: AppColors.clr_bg_grey,
                                      )))
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Text("Wed, Sep 23, 11:00am - 1:00pm",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_black2,
                                fontFamily: 'MuliRegular',
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Text("Crown Hotel, New York",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: AppColors.clr_bg_black2,
                                  fontFamily: 'MuliRegular'
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.clr_bg_grey),
                          color: AppColors.clr_white),
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
                                            fontFamily: 'MuliBold',
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
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        color: AppColors.clr_bg_black2,
                                        fontFamily: 'MuliRegular',
                                      )),
                                  SizedBox(
                                    height: AppSizes.height * 0.01,
                                  ),
                                  Text("Samurai Jobs:18",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 15,
                                          color: AppColors.clr_bg_black2,
                                          fontFamily: 'MuliRegular'
                                      ))
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.arrow_forward_ios,size: 15,)],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:AppSizes.width*0.04),
                      child: Text("Other Applicants",style: TextStyle(
                        fontSize: 22,
                        fontFamily: Assets.muliBold,
                      ),),
                    ),
                    Container(  margin: EdgeInsets.all(AppSizes.width*0.042),child: _applicationComponents.getApplicants(context)),
                    Container(  margin: EdgeInsets.all(AppSizes.width*0.042),child: _applicationComponents.getApplicants(context)),


                  ],
                ),
              ),
              ],
          ),
        ),
      ),
    );
  }
}
