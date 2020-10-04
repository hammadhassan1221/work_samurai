import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/sizes.dart';
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

  void navigateToNextRoute(BuildContext context) async {
    await Future.delayed(Duration(
      seconds: 4,
    ));
    Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
  }
}