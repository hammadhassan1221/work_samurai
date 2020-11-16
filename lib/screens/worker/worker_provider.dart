

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/jobs_in_progress_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/widgets/loader.dart';

class WorkerProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse futureJobsResponse = FutureJobsResponse.empty();
  JobsInProgressResponse jobsInProgressResponse = JobsInProgressResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  FutureJobsResponse _futureJobsResponse = FutureJobsResponse.empty();
  Loader _loader = Loader();

  bool _isFutureJobsFetched = false;


  bool isOfferFetched = false;
  bool inProgress = false;
  init({@required BuildContext context}) async{
    this.context = context;
  }


  void setValue(RangeValues values){
    this.values = values;
    notifyListeners();
  }


}