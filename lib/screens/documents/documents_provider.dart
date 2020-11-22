import 'package:flutter/cupertino.dart';

class DocumentProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}