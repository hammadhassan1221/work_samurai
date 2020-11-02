import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/card_details/card.dart';
import 'package:work_samurai/screens/business/document_verification/document_verify.dart';
import 'package:work_samurai/screens/business/home/pages/account/account_components.dart';
import 'package:work_samurai/screens/business/payment_history/payment_history.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AccountComponent _accountComponent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _accountComponent = AccountComponent();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.height * 0.9,
        width: AppSizes.width * 0.9,
        color: AppColors.clr_bg,
        padding: EdgeInsets.only(left:AppSizes.height*0.04),
        child: ListView(
          children: [
            _accountComponent.getUserEdit(imagePath: Assets.support, text: "Edit"),

            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Robert Miller",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'MuliBold,'

                            )
                        ),
                        SizedBox(
                          width: AppSizes.width * 0.02,
                        ),
                        Container(
                            padding: EdgeInsets.all(2.0),
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
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'MuliRegular',
                                      color: AppColors.clr_bg_grey,
                                    )
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    Container(
                      width: AppSizes.width * 0.85,
                      child: Text(
                          "New York",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.clr_bg_black,
                            fontFamily: 'MuliSemiBold',
                          )
                      ),
                    ),
                  ],
                )
            ),

            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            _accountComponent.getUserDetails(text:"Fusce maximus cursus lectus, varius ultricies erat molestie vel. Fusce sapien urna, rhoncus et tempor vel, placerat eu velit. Pellentesque nec felis pulvinar, luctus lectus eget!",
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),

            _accountComponent.getDocumentDetails(text: "Work rights verified"),

            _accountComponent.getDocumentDetails(text: "Driver License verified",),

            _accountComponent.getDocumentDetails(text: "Police check"),

            Container(
              margin: EdgeInsets.only(top: AppSizes.height*0.015),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1,color: AppColors.clr_bg_grey))
                ),
                width: AppSizes.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Info",style: TextStyle(
                      color: AppColors.clr_bg_black,fontSize: 22,
                      fontFamily: 'MuliBold',
                    ),),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, SlideRightRoute(page: DocumentVerification()));
                      },
                      child: Row(
                        children: [
                         Image.asset(Assets.sign,height: 25,width: 25,),
                          SizedBox(
                            width: AppSizes.width*0.02,
                          ),
                          Text(
                            "Document Verification",
                            style: TextStyle(
                              fontFamily: 'MuliSemiBold',
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, SlideRightRoute(page:CardDetails()));
                      },
                      child: Row(
                        children: [
                          Image.asset(Assets.card,height: 25,width: 25,),
                          SizedBox(
                            width: AppSizes.width*0.02,
                          ),
                          Text(
                            "Card Details",
                            style: TextStyle(
                              fontFamily: 'MuliSemiBold',
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.015,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,  SlideRightRoute(page: PaymentHistory()));
                      },
                      child: Row(
                        children: [
                          Image.asset(Assets.payment,height: 25,width: 25,),
                          SizedBox(
                            width: AppSizes.width*0.02,
                          ),
                          Text(
                            "Payments",
                            style: TextStyle(
                              fontFamily: 'MuliSemiBold',
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                  ],
                )
            ),

           _accountComponent.getHeadings(text: "Completed Jobs"),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Text(
                    "4",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuliSemiBold',
                      color: AppColors.clr_bg_black,
                    )
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            _accountComponent.getHeadings(text: "Positions"),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
                width: AppSizes.width * 0.85,
                child: Wrap(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Waiter",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Bartender",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    ),
                    SizedBox(
                      width: AppSizes.width * 0.05,
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.clr_field,
                        ),
                        child: Text(
                            "Barista",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
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
                            "Receptionist",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black,
                            )
                        )
                    )
                  ],
                )
            ),
            SizedBox(
              height: AppSizes.height * 0.03,
            ),
            Divider(
              indent: 20,
              endIndent: 30,
            ),
            _accountComponent.getHeadings(text: "Compliments"),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),


            _accountComponent.getCompliments(imagePath: Assets.diamond, compliment: "Perfect Service", rating: "3"),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),


            _accountComponent.getCompliments(imagePath: Assets.communicate, compliment: "Good Communication", rating: "10"),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            _accountComponent.getCompliments(imagePath: Assets.muscle, compliment: "Hard Worker", rating: "6")

          ],
        )
    );
  }
}
