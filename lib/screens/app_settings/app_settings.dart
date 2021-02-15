import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/app_settings/app_settings_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'app_settings_components.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  AppSettingsComponents _appSettingsComponents;
  AppSettingsProviders _appSettingsProviders;
  bool isEnabled, isEnabled1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appSettingsComponents = AppSettingsComponents();
    _appSettingsProviders = Provider.of<AppSettingsProviders>(context,listen: false);
     isEnabled = isEnabled1 = false;
     _appSettingsProviders.init(context: context);
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
              // _appSettingsProviders.notificationSettings(context: context, value: value);
            }),
            SizedBox(height: AppSizes.height*0.02,),
            _appSettingsComponents.getSettingText(text: "Terms Of Use"),

            SizedBox(height: AppSizes.height*0.02,),

            _appSettingsComponents.getSettingText(text: "Help"),

            SizedBox(height: AppSizes.height*0.02,),
            _appSettingsComponents.getSettingText(text: "FeedBack"),

            SizedBox(height: AppSizes.height*0.02,),
            CommonWidgets.getBottomButton(name: "Update", onButtonClick: (){

              // String str = json.encode([
              //   {
              //     "Name": "App Settings",
              //     "Value": "false",
              //     "SettingList": [
              //       {"Name": "Dark mode", "Value": "true"},
              //       {"Name": "Notification Sound", "Value": "true"}
              //     ],
              //   }
              // ]);

              _appSettingsProviders.themeSettings(
                context: context,

              );
            }),
          ],
        ),
      ),
    ));
  }
}
