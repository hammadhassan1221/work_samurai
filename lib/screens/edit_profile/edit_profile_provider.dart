import 'package:flutter/cupertino.dart';

class EditProfileProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}