import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/home/home.dart';
import 'package:work_samurai/screens/signup/signup_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

SignUpComponents _signUpComponents;

class _SignUpState extends State<SignUp> {
  bool onCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signUpComponents = SignUpComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_field,
        child:Column(
          children: [
            CommonWidgets.getAppBarWithout(text: "Sign Up"),
            Expanded(
                child: ListView(
                  children: [
                    _signUpComponents.getInputField(
                        backgroundColor: AppColors.transparentColor,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: "First Name",
                        imagePath: Assets.profileS,
                    ),
                    _signUpComponents.getInputField(
                        backgroundColor: AppColors.transparentColor,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: "Last Name",
                        imagePath: Assets.profileS,
                    ),
                    _signUpComponents.getInputField(
                        backgroundColor: AppColors.transparentColor,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: "Email",
                        imagePath: Assets.mail),
                    _signUpComponents.getInputField(
                        backgroundColor: AppColors.transparentColor,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: "Password",
                        imagePath: Assets.lock),
                    _signUpComponents.getInputField(
                        backgroundColor: AppColors.transparentColor,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: "Country",
                        imagePath: Assets.city),
                    Container(
                        margin: EdgeInsets.only(
                            top: AppSizes.height * 0.01,
                            left: AppSizes.width * 0.03,
                            right: AppSizes.width * 0.03),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                              color: AppColors.clr_bg_black,
                              fontFamily: 'MuliRegular',
                              fontSize: 16),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: AppSizes.width * 0.03,
                          right: AppSizes.width * 0.03),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Radio(
                            activeColor: AppColors.clr_bg_black,
                            //autofocus: true,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'MuliRegular'),
                          ),
                          SizedBox(
                            width: AppSizes.width * 0.1,
                          ),
                          Radio(
                            activeColor: AppColors.clr_bg_black,
                            //autofocus: true,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'MuliRegular'),
                          ),
                        ],
                      ),
                    ),

                    _signUpComponents.getInputField(backgroundColor: AppColors.transparentColor, borderColor: AppColors.sign_field, textColor: AppColors.clr_bg_black, text: "Phone Number", imagePath: Assets.phone),

                    Container(
                        margin: EdgeInsets.only(top:AppSizes.height*0.008,left:AppSizes.height*0.03,right:AppSizes.height*0.03,),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: AppColors.clr_white,
                              activeColor: AppColors.clr_bg_black,
                              value: onCheck,
                              onChanged: (bool value) {
                                setState(() {
                                  onCheck = value;
                                });
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'I accept the  ',
                                  style: TextStyle(
                                      color: AppColors.clr_bg_black, fontSize: 13),

                                  children: <TextSpan>[
                                    TextSpan(text: 'Term and Conditions',
                                        style: TextStyle(
                                          color: AppColors.clr_bg_black,
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          fontFamily: Assets.muliSemiBold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // navigate to desired screen
                                          }
                                    )
                                  ]
                              ),
                            )
                          ],
                        )
                    ),

                    SizedBox(height: AppSizes.height*0.05,),

                    CommonWidgets.getButton(backgroundColor: AppColors.clr_bg_black, borderColor: AppColors.transparentColor, textColor: AppColors.clr_white, text: "Sign Up", onPress: (){
                      Navigator.push(context, SlideRightRoute(page: Home()));
                    }),

                    /* GestureDetector(
              onTap: (){
                Navigator.push(context, SlideRightRoute(page: Home()));
              },
              child: Container(
                height: AppSizes.height*0.07,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: AppColors.clr_bg_black,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  margin: EdgeInsets.only(top:AppSizes.height*0.008,left:AppSizes.height*0.03,right:AppSizes.height*0.03,),

                  child: Text("Sign up",style: TextStyle(color: AppColors.clr_white,fontSize: 16,fontFamily: Assets.muliRegular),
                  textAlign: TextAlign.center,)),
            )*/
                  ],
                )),


          ],
        )
      ),
    ));
  }
}
