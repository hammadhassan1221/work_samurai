import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile_provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/screens/worker/pages/account/account_provider.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'edit_profile_components.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  EditProfileComponents _editProfileComponents;
  bool _verifyEmail = false;
  bool _verifyPhone = false;
  AccountProviders _accountProviders;

  EditProfileProviders _editProfileProviders;
  TextEditingController _aboutController = TextEditingController();
  //TextEditingController _firstName,_lastName;
  TextEditingController firstname, lastname;
  UserWholeData _userWholeData;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();

  @override
  void initState() {
    super.initState();

    // _firstName = TextEditingController();
    // _lastName = TextEditingController();
    _editProfileComponents = EditProfileComponents();
    _editProfileProviders =
        Provider.of<EditProfileProviders>(context, listen: false);
    _editProfileProviders.init(context: context);
    String userDataFromPrefs = PreferenceUtils.getString(Strings.USER_DATA);
    _accountProviders = Provider.of<AccountProviders>(context, listen: false);


    if (userDataFromPrefs.isNotEmpty) {
      _verifyEmail = _verifyPhone = false;
      _userWholeData = UserWholeData.fromJson(
          _genericDecodeEncode.decodeJson(userDataFromPrefs));
      _verifyEmail = _userWholeData.data.user.emailVerified;
      _verifyPhone = _userWholeData.data.user.phoneVerified;

    }
    firstname = TextEditingController(text: _userWholeData.data.user.firstname);
    lastname =TextEditingController(text: _userWholeData.data.user.lastname);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EditProfileProviders>(context, listen: true);
    _accountProviders = Provider.of<AccountProviders>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
            children: [
              CommonWidgets.getAppBar(text: "Edit Profile", context: context),
              //index == 1 ? showToast : SizedBox.shrink(),
              SizedBox(
                height: AppSizes.height * 0.05,
              ),
              Expanded(
                child: ListView(
                  children: [
                    _editProfileComponents.getUserImage(
                        onPress: () {
                         // ApplicationToast.getSuccessToast(durationTime: 2, heading: "null", subHeading: "Hello");
                        }, imagePath: _accountProviders.getUserWholeData().data.user.document == null ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThsyVVdxkz5zyuE-yRKpdwtre_R234HkS2gQ&usqp=CAU" :_accountProviders.getUserWholeData().data.user.document["URL"],
                        editProfileObj: _editProfileProviders),
                    SizedBox(
                      height: AppSizes.height * 0.05,
                    ),
                    _editProfileComponents.getInputField(
                      firstname: firstname,
                        backgroundColor: AppColors.clr_bg,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: _userWholeData?.data?.user?.firstname,
                        //controller: ,
                        text1:"",
                        isPassword: false),
                    _editProfileComponents.getInputField(
                      firstname: lastname,
                        backgroundColor: AppColors.clr_bg,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: _userWholeData?.data?.user?.lastname,
                        text1:"",
                      //  controller: _lastName ,
                        isPassword: false),
                    _verifyEmail
                        ? _editProfileComponents.getVerificationContainer(
                            onPress: () {
                              _emailSheet(context);
                             /* _editProfileProviders.getVerifiedEmail(
                                  context: context);*/
                            },
                            backgroundColor: AppColors.clr_bg,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black2,
                            text: "Email",
                            text1: _accountProviders.getUserWholeData().data.user.emailAddress,
                            isPassword: false,
                            iconData: Icons.check_circle,
                            verify: "Verified",
                            verifyColor: Colors.green)
                        : _editProfileComponents.getVerificationContainer(
                            onPress: () {
                              _emailSheet(context);
                            },
                            backgroundColor: AppColors.clr_bg,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black2,
                            text: "Email",
                            text1: _userWholeData?.data?.user?.emailAddress
                                .toString(),
                            isPassword: false,
                            iconData: Icons.arrow_forward_ios,
                            verify: "Unverified",
                            verifyColor: Colors.orangeAccent),
                    _verifyPhone
                        ? _editProfileComponents.getVerificationContainer(
                            onPress: () {
                              _phoneSheet(context);
                              _editProfileProviders.getVerifiedPhone(
                                  context: context);
                            },
                            backgroundColor: AppColors.clr_bg,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black2,
                            text: "Phone",
                            text1: _accountProviders.getUserWholeData().data.user.mobile,/*_userWholeData.data.user.mobile.toString(),*/
                            isPassword: false,
                            iconData: Icons.check_circle,
                            verify: "Verified",
                            verifyColor: Colors.green)
                        : _editProfileComponents.getVerificationContainer(
                            onPress: () {
                              //_phoneSheet(context);
                              _editProfileProviders.getVerifiedPhone(
                                  context: context);
                            },
                            backgroundColor: AppColors.clr_bg,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black2,
                            text: "Phone",
                            text1: _userWholeData?.data?.user?.mobile?.toString(),
                            isPassword: false,
                            iconData: Icons.arrow_forward_ios,
                            verify: "Unverified",
                            verifyColor: Colors.orangeAccent),
                    _editProfileComponents.getDescriptionContainer(
                        heading: "About You", desc: "",controllor: _aboutController),
                    SizedBox(
                      height: AppSizes.height * 0.05,
                    ),
                    CommonWidgets.getBottomButton(
                        name: "Update", onButtonClick: () async {
                      String firstName = _userWholeData?.data?.user.firstname;
                      String lastName = _userWholeData?.data?.user.lastname;
                          if (firstname.text.isNotEmpty ){
                          firstName   = firstname.text ;
                          }
                      if (lastname.text.isNotEmpty ){
                        lastName   = lastname.text ;
                      }

                          String salutation =_userWholeData?.data?.user?.salutation ?? "Mr.";
                          String proTitle = _userWholeData?.data?.user?.professionalTitle ?? "";
                          String dob = _userWholeData?.data?.user?.dob ?? "";
                          String placeOfBirth = _userWholeData?.data?.user?.lastname ?? "";
                          String gender = _userWholeData?.data?.user?.gender?.toString() ?? "";
                          String description = _aboutController?.text?.toString() ?? "";
                          String imagePath = _editProfileProviders?.userImage?.path ?? "";

                        //  List<String> array = [firstName, lastName,salutation,proTitle,dob,placeOfBirth,gender,description,imagePath];
                          _editProfileProviders.sendUpdate(firstName, lastName,salutation,proTitle,dob,placeOfBirth,gender,description,imagePath, context);
                        }
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _emailSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(AppSizes.width * 0.05),
            color: AppColors.clr_white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Verification",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuliSemiBold',
                      color: AppColors.clr_bg_black),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      Assets.basicMail,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Text(
                  "An email has been sent with the email verification link. Check your Spam or Junk Mail folder for the verification email.",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Spacer(),
                CommonWidgets.getBottomButton(
                    onButtonClick: () {
                      Navigator.pop(context);
                    },
                    name: "Dismiss"),
              ],
            ),
          );
        });
  }

  _phoneSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(AppSizes.width * 0.05),
            color: AppColors.clr_white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mobile Verification",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MuliSemiBold',
                      color: AppColors.clr_bg_black),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.height * 0.02),
                    height: AppSizes.height * 0.15,
                    width: AppSizes.width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.sign_field),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Code",
                          style: TextStyle(color: AppColors.clr_bg_grey),
                        ),
                        SizedBox(
                          height: AppSizes.height * 0.015,
                        ),
                        Text(
                          "000 - 000",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'MuliRegular',
                              color: AppColors.clr_bg_black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Text(
                  "Please enter the verification code which is sent on  " + /*_userWholeData.data.user.mobile +*/
                      "   Alternatively you can retry in 10 secs.",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                CommonWidgets.getBottomButton(
                    name: "Retry In 10 sec"),
              ],
            ),
          );
        });
  }
}
