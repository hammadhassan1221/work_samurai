import 'package:flutter/cupertino.dart';

class CompleteProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context})
  {
    this.context = context;
  }
}