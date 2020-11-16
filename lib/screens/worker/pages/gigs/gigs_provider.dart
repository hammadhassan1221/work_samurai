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

class GigsProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse _futureJobsResponse = FutureJobsResponse.empty();
  JobsInProgressResponse _jobsInResponse = JobsInProgressResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  bool _isFutureJobsFetched = false;
  bool _inProgress = false;

  init({@required BuildContext context}) async {
    try {
      await _getFutureJobs(context: context);
      this.context = context;
    } catch (e) {
      print(e.toString());
    }
  }

  void setValue(RangeValues values) {
    this.values = values;

    notifyListeners();
  }

  Future _getFutureJobs({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(
        getFutureJobURL,
        headers: {
          "Authorization":
              "Bearer Xyai07xrQsefpXavQ5fnXhn2km+cPWOnbhvHKrvKvw0fFxAwOcTMUML7jTtqJ+S6DAAAtKVsI8vYgzUJzxrVQA=",
          "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F"
        },
      );

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _futureJobsResponse = FutureJobsResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        _isFutureJobsFetched = true;

        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future getJobsInProgress({@required BuildContext context}) async{

    try{
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(
          getInProgressJobURL,
          headers:{
            "Authorization" : "Bearer Xyai07xrQsefpXavQ5fnXhn2km+cPWOnbhvHKrvKvw0fFxAwOcTMUML7jTtqJ+S6DAAAtKVsI8vYgzUJzxrVQA=",
            "DeviceId" : "A580E6FE-DA99-4066-AFC7-C939104AED7F"
          }
      );

      if(_response.statusCode != 200){
        throw("Unauthorized");
      }
      if(_response.statusCode == 200){
        _loader.hideLoader(context);
        _jobsInResponse = JobsInProgressResponse.fromJson(_genericDecodeEncode.decodeJson(Helper.getString(_response)));
        if(_jobsInResponse.data != null){
          notifyListeners();
        }
        _inProgress = true;

      }
    }
    catch(e){
      print(e.toString());
    }
  }


  getFutureJobResponse() {
    return this._futureJobsResponse;
  }

  getFutureJobFetched() {
    return this._isFutureJobsFetched;
  }

  getJobsInProgressResponse() {
    return this._jobsInResponse;
  }


  getFetchJobInProgress() {
    return this._inProgress;
  }

  void setInProgress(bool value){
    this._inProgress = value;
    notifyListeners();
  }
}
