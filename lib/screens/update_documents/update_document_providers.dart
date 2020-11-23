import 'package:flutter/cupertino.dart';

class UpdateDocumentProviders extends ChangeNotifier{
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}