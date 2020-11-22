import 'package:flutter/cupertino.dart';

class ChatProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}