import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'edit_profile_components.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  EditProfileComponents _editProfileComponents;
  bool _verifyEmail,_verifyPhone;
  EditProfileProviders _editProfileProviders;

  UserWholeData _userWholeData;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _editProfileComponents = EditProfileComponents();
    _editProfileProviders= Provider.of<EditProfileProviders>(context,listen :false);
    String userDataFromPrefs = PreferenceUtils.getString(Strings.USER_DATA);

    _userWholeData = UserWholeData.fromJson(
        _genericDecodeEncode.decodeJson(userDataFromPrefs));

    _verifyEmail = _userWholeData.data.user.emailVerified;
    _verifyPhone = _userWholeData.data.user.phoneVerified;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EditProfileProviders>(context,listen :true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
            children: [
              CommonWidgets.getAppBar(text: "Edit Profile", context: context),
              SizedBox(
                height: AppSizes.height * 0.05,
              ),
              Expanded(
                child: ListView(
                  children: [
                    _editProfileComponents.getUserImage(
                        onPress: () {}, imagePath: Assets.support),
                    SizedBox(
                      height: AppSizes.height * 0.05,
                    ),
                    _editProfileComponents.getInputField(
                        backgroundColor: AppColors.clr_bg,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: _userWholeData.data.user.firstname.toString(),
                        /*controller: null,*/
                        isPassword: false),
                    _editProfileComponents.getInputField(
                        backgroundColor: AppColors.clr_bg,
                        borderColor: AppColors.sign_field,
                        textColor: AppColors.clr_bg_black,
                        text: _userWholeData.data.user.lastname.toString(),
                        /*controller: null,*/
                        isPassword: false),
                    _verifyEmail
                        ? _editProfileComponents.getVerificationContainer(
                            onPress: () {},
                            backgroundColor: AppColors.clr_bg,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black2,
                            text: "Email",
                            text1: _userWholeData.data.user.emailAddress
                                .toString(),
                            isPassword: false,
                            iconData: Icons.arrow_forward_ios,
                            verify: "Unverified",
                            verifyColor: Colors.orangeAccent)
                        : _editProfileComponents.getVerificationContainer(
                            onPress: () {
                             // _emailSheet(context);
                              _editProfileProviders.getVerifiedEmail(context: context);
                            },
                            backgroundColor: AppColors.clr_bg,
                            borderColor: AppColors.sign_field,
                            textColor: AppColors.clr_bg_black2,
                            text: "Email",
                            text1: _userWholeData.data.user.emailAddress
                                .toString(),
                            isPassword: false,
                            iconData: Icons.check_circle,
                            verify: "Verified",
                            verifyColor: Colors.green),
                   _verifyPhone ? _editProfileComponents.getVerificationContainer(
                       onPress: () {},
                       backgroundColor: AppColors.clr_bg,
                       borderColor: AppColors.sign_field,
                       textColor: AppColors.clr_bg_black2,
                       text: "Phone",
                       text1: _userWholeData.data.user.mobile
                           .toString(),
                       isPassword: false,
                       iconData: Icons.arrow_forward_ios,
                       verify: "Unverified",
                       verifyColor: Colors.orangeAccent)
                       : _editProfileComponents.getVerificationContainer(
                       onPress: () {
                         _phoneSheet(context);
                       },
                       backgroundColor: AppColors.clr_bg,
                       borderColor: AppColors.sign_field,
                       textColor: AppColors.clr_bg_black2,
                       text: "Phone",
                       text1: _userWholeData.data.user.mobile
                           .toString(),
                       isPassword: false,
                       iconData: Icons.check_circle,
                       verify: "Verified",
                       verifyColor: Colors.green),
                    _editProfileComponents.getDescriptionContainer(
                        heading: "About You", desc: ""),
                    SizedBox(
                      height: AppSizes.height * 0.05,
                    ),
                    CommonWidgets.getSignUpButton(
                        context: context, onPress: () {}, text: "Update"),
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
                      fontSize: 20,
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
                    color: AppColors.clr_bg_black,
                  ),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Text(
                  "An email has been sent with the email verification link. Check your Spam or Junk Mail folder for the verification email.",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Expanded(
                    child: CommonWidgets.getSignUpButton(
                        context: context,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        text: "Dismiss")),
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
                      fontSize: 20,
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
                  "Please enter the verification code which is sent on  " + _userWholeData.data.user.mobile + "   Alternatively you can retry in 10 secs.",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'MuliRegular',
                      color: AppColors.clr_bg_black),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                ),
                Expanded(
                    child: CommonWidgets.getSignUpButton(
                        context: context,
                        onPress: () {},
                        text: "Retry In 10 sec")),
              ],
            ),
          );
        });
  }
}

