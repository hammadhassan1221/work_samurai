import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/app_settings/app_settings.dart';
import 'package:work_samurai/screens/card_details/card_details.dart';
import 'package:work_samurai/screens/documents/documents.dart';
import 'package:work_samurai/screens/earnings/earnings.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile.dart';
import 'package:work_samurai/screens/job_roles/job_roles.dart';
import 'package:work_samurai/screens/password/password.dart';
import 'package:work_samurai/screens/settings/settings_components.dart';
import 'package:work_samurai/screens/settings/settings_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsComponents _settingsComponents;
  SettingsProviders _settingsProviders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _settingsComponents = SettingsComponents();
    _settingsProviders = Provider.of<SettingsProviders>(context, listen: false);
    _settingsProviders.init(context: context);
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
                CommonWidgets.getAppBar(text: "Account Settings", context: context),

               Expanded(child: (ListView(
                 children: [
                   _settingsComponents.getProfileThread(onPress: (){Navigator.push(context, SlideRightRoute(page: ProfileSettings()));}, imagePath: Assets.support, heading: "Robert Miller", subHeading: "Edit Profile",iconData: ""),

                   _settingsComponents.getHeadings(imagePath:Assets.basicMail ,text: "Change Password", onPress: (){
                     Navigator.push(context, SlideRightRoute(page:ChangePassword()));
                   }),
                   _settingsComponents.getHeadings(imagePath:Assets.flag ,text: "Document Verification",onPress: (){
                     Navigator.push(context, SlideRightRoute(page:DocumentVerification()));
                   }),
                   _settingsComponents.getHeadings(imagePath:Assets.userCard,text: "Earning", onPress: (){
                     Navigator.push(context, SlideRightRoute(page:Earnings()));
                   }),

                   _settingsComponents.getHeadings(imagePath:Assets.credit,text: "Bank Info", onPress: (){
                     Navigator.push(context, SlideRightRoute(page:CardDetails()));
                   }),

                   _settingsComponents.getHeadings(imagePath:Assets.userCard,text: "Job Roles", onPress: (){
                     Navigator.push(context, SlideRightRoute(page:JobRole()));
                   }),

                   _settingsComponents.getHeadings(imagePath:Assets.slider,text: "App Settings", onPress: (){
                     Navigator.push(context, SlideRightRoute(page:AppSettings()));
                   }),

                   _settingsComponents.getHeadings(imagePath:Assets.logout,text: "Logout", onPress: (){_showDialog();/**/}),

                 ],
               )))
              ],
            ),
          ),

        ));
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:  Text("Do you want to Sign out ?"),
          actions: <Widget>[
            FlatButton(
              child:  Text("Sign Out"),
              onPressed: () {
                _settingsProviders.signout(context: context);
              },
            ),
          ],
        );
      },
    );
  }
}
