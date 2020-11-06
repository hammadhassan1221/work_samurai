import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/models/hitting_model/sign_up_screen/sign_up_model.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/sign_up/sign_up_providers.dart';
import 'package:work_samurai/screens/sign_up/signup_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

SignUpComponents _signUpComponents;

class _SignUpState extends State<SignUp> {
bool onCheck = false;
SignUpModel _signUpModel;
TextEditingController _email,
    _password,
    _confirmPassword,
    _phoneNumber,
    _firstName,
    _lastName;
SignUpProvider _signUpProvider;

String male, female;
FocusNode _focusNode;

int _selectedIndex;

@override
void initState() {
  // TODO: implement initState
  super.initState();
  _signUpComponents = SignUpComponents();
  _signUpModel = SignUpModel();
  male = "";
  female = "";
  _focusNode = FocusNode();
  _email = TextEditingController();
  _password = TextEditingController();
  _phoneNumber = TextEditingController();
  _firstName = TextEditingController();
  _lastName = TextEditingController();
  _confirmPassword = TextEditingController();
  _signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
  _signUpProvider.init(context: context);
  _selectedIndex = 0;
}

onSelect(value) {
  setState(() {
    _selectedIndex = value;
  });
}

@override
Widget build(BuildContext context) {
  _signUpProvider = Provider.of<SignUpProvider>(context, listen: true);
  return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.clr_field,
            child: Column(
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
                          controller: _firstName,
                          isPassword: false,
                        ),
                        _signUpComponents.getInputField(
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.sign_field,
                          textColor: AppColors.clr_bg_black,
                          text: "Last Name",
                          imagePath: Assets.profileS,
                          controller: _lastName,
                          isPassword: false,
                        ),
                        _signUpComponents.getInputField(
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.sign_field,
                          textColor: AppColors.clr_bg_black,
                          text: "Email",
                          imagePath: Assets.mail,
                          controller: _email,
                          isPassword: false,
                        ),
                        _signUpComponents.getInputField(
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.sign_field,
                          textColor: AppColors.clr_bg_black,
                          text: "Password",
                          imagePath: Assets.lock,
                          controller: _password,
                          isPassword: true,
                        ),
                        _signUpComponents.getInputField(
                            backgroundColor: AppColors.transparentColor,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black,
                            text: "Confirm Password",
                            imagePath: Assets.lock,
                            controller: _confirmPassword,
                            isPassword: true),
                        _signUpComponents.getInputField(
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.sign_field,
                          textColor: AppColors.clr_bg_black,
                          text: "Country",
                          imagePath: Assets.city,
                          isPassword: false,
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: AppSizes.height * 0.01,
                                left: AppSizes.width * 0.03,
                                right: AppSizes.width * 0.03),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: AppColors.clr_bg_black,
                                      fontFamily: 'MuliRegular',
                                      fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: _selectedIndex,
                                      activeColor: AppColors.clr_bg_black,
                                      onChanged: (index) {
                                        onSelect(index);
                                        setState(() {
                                          male = "Male";
                                        });
                                      },
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
                                      value: 2,
                                      groupValue: _selectedIndex,
                                      activeColor: AppColors.clr_bg_black,
                                      onChanged: (index) {
                                        onSelect(index);
                                        setState(() {
                                          female = "Female";
                                        });
                                      },
                                      //autofocus: true,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'MuliRegular'),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        _signUpComponents.getInputField(
                          backgroundColor: AppColors.transparentColor,
                          borderColor: AppColors.sign_field,
                          textColor: AppColors.clr_bg_black,
                          text: "Phone Number",
                          imagePath: Assets.phone,
                          controller: _phoneNumber,
                          isPassword: false,
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: AppSizes.height * 0.008,
                              left: AppSizes.height * 0.03,
                              right: AppSizes.height * 0.03,
                            ),
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
                                          fontFamily: 'MuliRegular',
                                          color: AppColors.clr_bg_black,
                                          fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Term and Conditions',
                                            style: TextStyle(
                                              color: AppColors.clr_bg_black,
                                              decoration: TextDecoration.underline,
                                              fontSize: 14,
                                              fontFamily: 'MuliSemiBold',
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // navigate to desired screen
                                              })
                                      ]),
                                )
                              ],
                            )),
                        SizedBox(
                          height: AppSizes.height * 0.05,
                        ),
                        _signUpComponents.getSignUpButton(
                          context: context,
                          onPress: () {
                            _makeSignUpModel();
                            _signUpProvider.callSignUpAPI(
                              signUpModel: _signUpModel,
                              context: context,
                              confirmPassword: _confirmPassword.text.toString(),
                              male: male,
                              female: female,
                              onCheck: onCheck,


                            );
                          },
                          text: "Sign Up",
                        ),
                      ],
                    )),
              ],
            )),
      ));
}

_makeSignUpModel() {
  _signUpModel.emailAddress = _email.text.toString();
  _signUpModel.password = _password.text.toString();
  _signUpModel.firstName = _firstName.text.toString();
  _signUpModel.lastName = _lastName.text.toString();
  _signUpModel.salutation = "";
  _signUpModel.professionalTitle = "";
  _signUpModel.dob = "";
  _signUpModel.placeOfBirth = "";
  _signUpModel.gender = getGenderText();
  _signUpModel.description = "";
  _signUpModel.tncAccepted = "";
  _signUpModel.phone = _phoneNumber.text.toString();
  _signUpModel.mobile = "";
  _signUpModel.facebook = "";
  _signUpModel.twitter = "";
  _signUpModel.instagram = "";
}

String getGenderText() {
  if (_selectedIndex == 0)
    return "Male";
  else
    return "Female";
}
}