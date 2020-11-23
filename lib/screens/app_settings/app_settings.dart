import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'app_settings_components.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  AppSettingsComponents _appSettingsComponents;
  bool isEnabled, isEnabled1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appSettingsComponents = AppSettingsComponents();
     isEnabled = isEnabled1 = false;
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: AppColors.clr_bg,
        height: AppSizes.height,
        width: AppSizes.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.getAppBar(text: "App Settings", context: context),
            SizedBox(height: AppSizes.height*0.04,),
            CommonWidgets.getRow("Notification Sound", isEnabled, (bool value) {
              setState(() {
                isEnabled = !isEnabled;
              });
            }),
            CommonWidgets.getRow("Dark Theme mode", isEnabled1, (bool value) {
              setState(() {
                isEnabled1 = !isEnabled1;
              });
            }),
            SizedBox(height: AppSizes.height*0.02,),
            _appSettingsComponents.getSettingText(text: "Terms Of Use"),

            SizedBox(height: AppSizes.height*0.02,),

            _appSettingsComponents.getSettingText(text: "Help"),

            SizedBox(height: AppSizes.height*0.02,),
            _appSettingsComponents.getSettingText(text: "FeedBack"),
          ],
        ),
      ),
    ));
  }
}
