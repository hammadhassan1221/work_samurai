import 'package:flutter/cupertino.dart';

class ArchiveProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context})
  {
    this.context = context;
  }
}