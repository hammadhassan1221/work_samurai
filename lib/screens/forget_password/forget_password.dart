import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'forget_password_components.dart';
import 'forget_password_provider.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgetPasswordComponents _forgetPasswordComponents;
  ForgetPasswordProvider _forgetPasswordProvider;
  TextEditingController _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _forgetPasswordComponents = ForgetPasswordComponents();
    _forgetPasswordProvider = Provider.of<ForgetPasswordProvider>(context, listen:false);
    _forgetPasswordProvider = ForgetPasswordProvider();
    _email = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    _forgetPasswordProvider = Provider.of<ForgetPasswordProvider>(context, listen:true);
    return SafeArea(child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_field,
        child: Column(
          children: [

            CommonWidgets.getAppBar(text: "Forget Password", context: context),
            _forgetPasswordComponents.getConfirmationText(),

            _forgetPasswordComponents.getInputField(backgroundColor: AppColors.clr_field, borderColor: AppColors.clr_bg_grey, textColor: AppColors.clr_bg_black2, text: "Email", imagePath: Assets.mail,controller: _email),

            CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Reset My Password"),
            /*_forgetPasswordComponents.getSignUpButton(context: context, onPress: (){
              _forgetPasswordProvider.callForgetPasswordAPI(context: context, email: _email.text.toString());
            }, text: "Reset my Password",)*/
          ],
        ),
      ),
    ));
  }
}
