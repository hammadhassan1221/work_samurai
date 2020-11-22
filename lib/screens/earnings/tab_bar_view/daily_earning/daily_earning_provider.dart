import 'package:flutter/cupertino.dart';

class DailyEarningProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}