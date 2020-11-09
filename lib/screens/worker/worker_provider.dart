import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/future_jobs_response.dart';
import 'package:work_samurai/models/api_models/jobs_in_progress_response.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/widgets/loader.dart';

class WorkerProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse futureJobsResponse = FutureJobsResponse();
  JobsInProgressResponse jobsInProgressResponse = JobsInProgressResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();


  bool isOfferFetched = false;
  bool inProgress = false;
  init({@required BuildContext context}) async{

    futureJobsResponse = FutureJobsResponse();
    await getFutureJobs(context: context);
    this.context = context;


    jobsInProgressResponse = JobsInProgressResponse();
    await getFutureJobs(context: context);
    this.context = context;
  }


  void setValue(RangeValues values){
    this.values = values;
    notifyListeners();
  }
}