import 'package:flutter/cupertino.dart';

class ScheduleProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}