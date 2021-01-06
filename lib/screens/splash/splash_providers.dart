import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/screens/worker/worker.dart';

class SplashProvider extends ChangeNotifier {
  String versionNumber="";

  BuildContext context;
  FirebaseMessaging _fcm = FirebaseMessaging();

  init({@required BuildContext context}) async{
    await getVersionNumber();
    this.context = context;
  }


  void getToken()async{
    final token = await _fcm.getToken();

    debugPrint('$token');
  }

  initializeResources(BuildContext context) {
    AppSizes.initializeSize(context);
  }

  getVersionNumber() async {
    try {
      versionNumber = await GetVersion.platformVersion;
    } on PlatformException {
      versionNumber = 'Failed to get project version.';
    }
    notifyListeners();
  }

  void navigateToNextRoute(BuildContext context) async {
    await Future.delayed(Duration(
      seconds: 4,
    ));

    if (PreferenceUtils.getBoolean(Strings.IS_LOGGED_IN) == true) {
      Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
    } else {
      Navigator.pushReplacement(context, SlideRightRoute(page: Login()));
    }
  }
}
