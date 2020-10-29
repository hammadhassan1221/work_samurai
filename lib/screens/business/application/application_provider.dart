import 'package:flutter/cupertino.dart';

class ApplicationProvider extends ChangeNotifier{

  BuildContext context;

  init({@required BuildContext context}){
    this.context = context;
  }

}