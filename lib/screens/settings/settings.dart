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
import 'package:work_samurai/screens/worker/pages/account/account_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsComponents _settingsComponents;
  SettingsProviders _settingsProviders;
  AccountProviders _accountProviders;


  @override
  void initState() {
    super.initState();
    _settingsComponents = SettingsComponents();
    _settingsProviders = Provider.of<SettingsProviders>(context, listen: false);
    _settingsProviders.init(context: context);
    _accountProviders = Provider.of<AccountProviders>(context, listen: false);
   // _accountProviders.getProfileData(context: context);

  }

  @override
  Widget build(BuildContext context) {
    _accountProviders = Provider.of<AccountProviders>(context, listen: true);

    return Scaffold(
      body: _accountProviders.getIsDataFetched()? Container(
    color: AppColors.clr_bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWidgets.getAppBarAccount(text: "Account Settings", context: context),
        Expanded(
            child: ListView(
          children: [
            _settingsComponents.getProfileThread(
              onPress: () {
                Navigator.push(
                  context,
                  SlideRightRoute(
                    page: ProfileSettings(),
                  ),
                );
              },
              imagePath: _accountProviders.getUserWholeData().data.user.document == null ? "https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png" :_accountProviders.getUserWholeData().data.user.document["URL"],
              heading: _accountProviders.getUserWholeData().data.user.firstname + " "+ _accountProviders.getUserWholeData().data.user.lastname,
              subHeading: "Edit Profile",
              iconData: "",
            ),
            _settingsComponents.getHeadings(
                imagePath: Assets.basicMail,
                text: "Change Password",
                onPress: () {
                  Navigator.push(
                      context, SlideRightRoute(page: ChangePassword()));
                }),
            _settingsComponents.getHeadings(
                imagePath: Assets.flag,
                text: "Document Verification",
                onPress: () {
                  Navigator.push(context,
                      SlideRightRoute(page: DocumentVerification()));
                }),
            _settingsComponents.getHeadings(
                imagePath: Assets.userCard,
                text: "Earning",
                onPress: () {
                  Navigator.push(
                      context, SlideRightRoute(page: Earnings()));
                }),
            _settingsComponents.getHeadings(
                imagePath: Assets.credit,
                text: "Bank Info",
                onPress: () {
                  Navigator.push(
                      context, SlideRightRoute(page: CardDetails()));
                }),
            _settingsComponents.getHeadings(
                imagePath: Assets.userCard,
                text: "Job Roles",
                onPress: () {
                  Navigator.push(context, SlideRightRoute(page: JobRole()));
                }),
            _settingsComponents.getHeadings(
                imagePath: Assets.slider,
                text: "App Settings",
                onPress: () {
                  Navigator.push(
                      context, SlideRightRoute(page: AppSettings()));
                }),
            _settingsComponents.getHeadings(
                imagePath: Assets.logout,
                text: "Logout",
                onPress: () {
                  _showDialog();
                }),
          ],
        ),
        ),
      ],
    ),
      ) : CircularProgressIndicator(),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("SIGN OUT"),
          actions: <Widget>[
            CupertinoButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            CupertinoButton(
              child: Text('Sign Out'),
              onPressed: () {
                _settingsProviders.signout(context: context);
              },
            )
          ],
        );
      },
    );
  }
}
