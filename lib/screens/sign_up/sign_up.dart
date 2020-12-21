import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/models/hitting_model/sign_up_screen/sign_up_model.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/sign_up/sign_up_providers.dart';
import 'package:work_samurai/screens/sign_up/signup_components.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

SignUpComponents _signUpComponents;
String _selectedSkillId;

class _SignUpState extends State<SignUp> {
  bool onCheck = false;
  SignUpModel _signUpModel;
  TextEditingController _email,
      _password,
      _confirmPassword,
      _phoneNumber,
      _firstName,
      _skillId,
      _lastName;
  SignUpProvider _signUpProvider;
  String _selectedValue;

  String male, female;
  FocusNode _focusNode;

  DateTime _selectedDate;
  int _currentYear;
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

    _skillId = TextEditingController();
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
          resizeToAvoidBottomPadding: true,
      body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
            children: [
              CommonWidgets.getAppBarWithout(text: "Sign Up"),
              Expanded(
                  child: ListView(
                children: [
                  CommonWidgets.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.sign_field,
                    textColor: AppColors.clr_bg_black,
                    text: "First Name",
                    imagePath: Assets.profileS,
                    controller: _firstName,
                    isPassword: false,
                  ),
                  CommonWidgets.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.sign_field,
                    textColor: AppColors.clr_bg_black,
                    text: "Last Name",
                    imagePath: Assets.profileS,
                    controller: _lastName,
                    isPassword: false,
                  ),
                  CommonWidgets.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.sign_field,
                    textColor: AppColors.clr_bg_black,
                    text: "Email",
                    imagePath: Assets.mail,
                    controller: _email,
                    isPassword: false,
                  ),
                  CommonWidgets.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.sign_field,
                    textColor: AppColors.clr_bg_black,
                    text: "Password",
                    imagePath: Assets.lock,
                    controller: _password,
                    isPassword: true,
                  ),
                  CommonWidgets.getInputField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.sign_field,
                    textColor: AppColors.clr_bg_black,
                    text: "Confirm Password",
                    imagePath: Assets.lock,
                    controller: _confirmPassword,
                    isPassword: true,
                  ),
                  _signUpProvider.isDataFetched
                      ? Container(
                          padding: EdgeInsets.only(
                            left: AppSizes.width * 0.03,
                            right: AppSizes.width * 0.03,
                          ),
                          height: AppSizes.height * 0.07,
                          width: AppSizes.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.sign_field),
                              borderRadius: BorderRadius.circular(8)),
                          margin: EdgeInsets.only(
                            left: AppSizes.width * 0.03,
                            right: AppSizes.width * 0.03,
                            top: AppSizes.width * 0.03,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedValue,
                              hint: Text("Select job skill"),
                              items: _signUpProvider.skills
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  _selectedValue = value;
                                  _selectedSkillId = _signUpProvider.skillIDs[
                                      _signUpProvider.skills.indexOf(value)];
                                });
                              },
                            ),
                          ),
                        )
                      : Container(),
                  Container(
                      margin: EdgeInsets.only(
                          top: AppSizes.height * 0.02,
                          left: AppSizes.height * 0.03,
                          right: AppSizes.width * 0.03),
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
                                width: AppSizes.width * 0.05,
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
                  CommonWidgets.phoneField(
                    backgroundColor: AppColors.transparentColor,
                    borderColor: AppColors.sign_field,
                    textColor: AppColors.clr_bg_black,
                    text: "Phone Number",
                    iconData: Icons.local_phone,
                    controller: _phoneNumber,
                    isPassword: false,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.height * 0.01,
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
                          Text(
                            'I accept the  ',
                            style: TextStyle(
                                fontFamily: 'MuliRegular',
                                color: AppColors.clr_bg_black,
                                fontSize: 13),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.clr_bg_black))),
                            child: Text(
                              'Terms and Conditions.',
                              style: TextStyle(
                                color: AppColors.clr_bg_black,
                                fontSize: 14,
                                fontFamily: 'MuliSemiBold',
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: AppSizes.height * 0.025,
                  ),
                  CommonWidgets.getSignUpButton(
                    context: context,
                    onPress: () {
                      if (_firstName.text.isNotEmpty) {
                        if (_lastName.text.isNotEmpty) {
                          if (_email.text.isNotEmpty) {
                            if (_password.text.isNotEmpty &&
                                _confirmPassword.text.isNotEmpty &&
                                (_password.text == _confirmPassword.text)) {
                              if (_selectedSkillId != null) {
                                if (getGenderText() != null) {
                                  if (_phoneNumber.text.isNotEmpty) {
                                    _signUpProvider.userSignUp(
                                      context: context,
                                      firstName: _firstName.text,
                                      lastName: _lastName.text,
                                      email: _email.text,
                                      password: _password.text,
                                      phone: _phoneNumber.text,
                                      skill: _selectedSkillId,
                                      gender: getGenderText(),
                                    );
                                  } else {
                                    ApplicationToast.getWarningToast(
                                        durationTime: 3,
                                        heading: "Error",
                                        subHeading: "Phone Number is empty");
                                  }
                                } else {
                                  ApplicationToast.getWarningToast(
                                      durationTime: 3,
                                      heading: "Error",
                                      subHeading: "Gender is empty");
                                }
                              } else {
                                ApplicationToast.getWarningToast(
                                    durationTime: 3,
                                    heading: "Error",
                                    subHeading: "Select skill");
                              }
                            } else {
                              ApplicationToast.getWarningToast(
                                  durationTime: 3,
                                  heading: "Error",
                                  subHeading:
                                      "Password and Confirm Password should be equal");
                            }
                          } else {
                            ApplicationToast.getWarningToast(
                                durationTime: 3,
                                heading: "Error",
                                subHeading: "Email is empty");
                          }
                        } else {
                          ApplicationToast.getWarningToast(
                              durationTime: 3,
                              heading: "Error",
                              subHeading: "Last Name is Empty");
                        }
                      } else {
                        ApplicationToast.getWarningToast(
                            durationTime: 3,
                            heading: "Error",
                            subHeading: "First Name is Empty");
                      }
                    },text: "Sign Up"
                  ),
                  SizedBox(
                    height: AppSizes.height * 0.025,
                  ),
                ],
              )),
            ],
          )),
    ));
  }

  SignUpModel _makeSignUpModel() {
    _signUpModel.skillId = _selectedSkillId;
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
