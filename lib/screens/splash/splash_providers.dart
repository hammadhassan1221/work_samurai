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
  String versionNumber;

  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }

  initializeResources(BuildContext context) {
    AppSizes.initializeSize(context);
  }

  void getVersionNumber() async {
    try {
      versionNumber = await GetVersion.projectVersion;
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
