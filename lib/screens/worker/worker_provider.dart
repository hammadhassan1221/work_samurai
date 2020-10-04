import 'package:flutter/cupertino.dart';

class WorkerProvider extends ChangeNotifier {
  BuildContext context;

  init({@required BuildContext context}) {
    this.context = context;
  }
}