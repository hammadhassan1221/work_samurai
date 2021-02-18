

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/jobs_in_progress_response.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/widgets/loader.dart';

class WorkerProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;
  int   currentIndex = 0;
  init({@required BuildContext context}) async{
    this.context = context;
  }

  setCurrentIndex(int index){
    this.currentIndex = index;
    notifyListeners();
  }


  void setValue(RangeValues values){
    this.values = values;
    notifyListeners();
  }



}