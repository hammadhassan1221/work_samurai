import 'package:flutter/cupertino.dart';

class CardDetailsProvider extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}