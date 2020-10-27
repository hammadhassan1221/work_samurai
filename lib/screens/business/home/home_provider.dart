
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

  BuildContext context;

  init({@required BuildContext context}){
    this.context = context;
  }

}