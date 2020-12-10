import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/password/password_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  PasswordComponents _passwordComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordComponents = PasswordComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.clr_bg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.getAppBar(text: "Change Password", context: context),
                _passwordComponents.getHeading(text: "Change Password"),
                  _passwordComponents.getInputField(backgroundColor: AppColors.clr_bg, borderColor: AppColors.sign_field, textColor: AppColors.clr_bg_black, text: "Current Password", /*controller: null,*/ isPassword: true),
                  _passwordComponents.getInputField(backgroundColor: AppColors.clr_bg, borderColor: AppColors.sign_field, textColor: AppColors.clr_bg_black, text: "New Password", /*controller: null,*/ isPassword: true),
                  _passwordComponents.getInputField(backgroundColor: AppColors.clr_bg, borderColor: AppColors.sign_field, textColor: AppColors.clr_bg_black, text: "Confirm Password", /*controller: null,*/ isPassword: true),

                Expanded(child: CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Change Password"))
,                SizedBox(height: AppSizes.height*0.025,),
              ],
            ),
          ),
        ));
  }
}