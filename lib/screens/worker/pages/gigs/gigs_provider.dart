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
  FutureJobsResponse _futureJobsResponse = FutureJobsResponse();
  JobsInProgressResponse _jobsInProgressResponse = JobsInProgressResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  bool _isFutureJobsFetched = false;

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
              "Bearer CAXVgT3ahg7e853Lr1exnX+EXzAs2d2gbRODYKJIjLo2k0noAoh4jbV+JC1ojq10i3V2ENe407Ax4hE/BLRbQ8tTLLHkJw3NmAN8ld9uvbF3pXKVGRZfwFwyLlF8N3aWo=",
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

  getFutureJobResponse() {
    return this._futureJobsResponse;
  }

  getFutureJobFetched() {
    return this._isFutureJobsFetched;
  }
}
