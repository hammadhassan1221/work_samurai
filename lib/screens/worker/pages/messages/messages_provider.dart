import 'package:flutter/cupertino.dart';

class MessageProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}