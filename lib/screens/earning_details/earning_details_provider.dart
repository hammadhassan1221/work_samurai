import 'package:flutter/cupertino.dart';

class EarningDetailsProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}