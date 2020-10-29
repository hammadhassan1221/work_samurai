import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkerProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;

  init({@required BuildContext context}) {
    this.context = context;
  }

  void setValue(RangeValues values){
    this.values = values;

    notifyListeners();
  }
}