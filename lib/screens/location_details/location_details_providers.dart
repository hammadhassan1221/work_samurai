import 'package:flutter/cupertino.dart';

class LocationDetailsProviders extends ChangeNotifier{

  BuildContext context;

  init({@required BuildContext context}) async {
    {
      this.context = context;
    }
  }
}