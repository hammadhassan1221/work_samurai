import 'package:flutter/cupertino.dart';

class AccountProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}