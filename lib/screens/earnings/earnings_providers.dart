import 'package:flutter/cupertino.dart';

class EarningProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}