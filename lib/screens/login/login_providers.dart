import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}