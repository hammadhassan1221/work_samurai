import 'package:flutter/cupertino.dart';

class ScheduleProviders extends ChangeNotifier{
  BuildContext context;
  bool value = false;


  init({@required BuildContext context}) {
    this.context = context;
  }

  void setToggleButton(bool value){
    this.value = !value;

  }
}