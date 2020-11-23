import 'package:flutter/cupertino.dart';

class AppSettingsProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}