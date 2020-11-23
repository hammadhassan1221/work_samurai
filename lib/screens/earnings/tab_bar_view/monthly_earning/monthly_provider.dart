import 'package:flutter/cupertino.dart';

class MonthlyProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}