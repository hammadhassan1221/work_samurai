import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/password/password_components.dart';
import 'package:work_samurai/screens/password/password_providers.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  PasswordComponents _passwordComponents;
  PasswordProviders _passwordProviders;

  TextEditingController _currentPassword, _newPassword, _confirmPassword;
  UserWholeData _userWholeData;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();

  @override
  void initState() {
    super.initState();
    _passwordComponents = PasswordComponents();
    //kia baat hai... is ko upar rakho
    _passwordProviders = Provider.of<PasswordProviders>(context, listen: false);
    _passwordProviders.init(context: context);
    String userDataFromPrefs = PreferenceUtils.getString(Strings.USER_DATA);
    if (userDataFromPrefs.isNotEmpty) {
      _userWholeData = UserWholeData.fromJson(
          _genericDecodeEncode.decodeJson(userDataFromPrefs));
    }

    _currentPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();

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
            _passwordComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "Current Password",
                controller: _currentPassword,
                isPassword: true),
            _passwordComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "New Password",
                controller: _newPassword,
                isPassword: true),
            _passwordComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "Confirm Password",
                controller: _confirmPassword,
                isPassword: true),
            SizedBox(height: 30,),
            CommonWidgets.getBottomButton(
                onButtonClick: () {
                  if (_currentPassword.text == "" || _confirmPassword.text == "" || _newPassword.text == ""){
                    ApplicationToast.getErrorToast(durationTime: 2, heading: null, subHeading: "Please fill password fields");

                  }

                  else{
                    if(_confirmPassword.text != _newPassword.text ){
                      ApplicationToast.getErrorToast(durationTime: 2, heading: null, subHeading: "Password is not matching ");

                    }
                    else{
                      _passwordProviders.callPasswordAPI(
                          context: context,
                          currentPassword: _currentPassword.text.toString(),
                          newPassword: _newPassword.text.toString(),
                          confirmPassword: _confirmPassword.text.toString());
                    }
                  }
                },
                name: "Change Password"),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
          ],
        ),
      ),
    ));
  }
}
