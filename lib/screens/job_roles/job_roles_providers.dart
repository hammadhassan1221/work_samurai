import 'package:flutter/cupertino.dart';

class JobRolesProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}