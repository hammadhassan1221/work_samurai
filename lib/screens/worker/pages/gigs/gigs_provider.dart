import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/jobs_in_progress_response.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class GigsProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse _futureJobsResponse = FutureJobsResponse.empty();
  JobsInProgressResponse _jobsInResponse = JobsInProgressResponse();
  UserWholeData _userWholeData = UserWholeData();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  bool _isFutureJobsFetched = false;
  bool _inProgress = false;
  bool _profileData = false;
  String _token;

  init({@required BuildContext context}) async {
    try {
      this.context = context;
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
     await _getProfileData(context: context);
      // await _getFutureJobs(context: context);
      // await _getJobsInProgress(context: context);
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

      Response _response = await _networkHelper.post(getFutureJobURL, headers: {
        "Authorization":
            "Bearer pds1BCxnnEyfbGoxLa9fdhwRTW/GXDlm7QA7pEiAkI4Flw3Io+ojrgUAMRzkPsPnff7SbYaxmLmu06DmLCemuk7641nAdqz1wwjsv1VivPKleNBKXuBRBoAwyhfhxwQQIfDVlNbIHsY0GpL5A2kRzFrjrWRvmVNwEGtC3GLfP5zIln3oc+E56sQ8NYDUY7lLsngG1XPO40SSHaTOAXtYd9wOrapbyo6vonKpOl/Tzc9oesLpaPnFQr5yqKJU5FSGV0sS85z8aUedYQ0UVLHucClQPc1skVeTePY6VBzBQx9yQ=",
        "DeviceID": "Device Id goes here",
      }, body: {});

      //        "Authorization": "Bearer" + _token,
      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _futureJobsResponse = FutureJobsResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        _isFutureJobsFetched = true;

        if (_futureJobsResponse.data != null) {
          notifyListeners();
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future _getProfileData({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
        "Scope":
            "profile,useraddress,preferences,userskills,usersettings,userverifications,usercompliments,userrating,CompletedJobs,supporttickets,company,companyaddress,companycompliments,companyrating,verificationmethods,compliments,systemskills,AccountVerified,paymentdetails",
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);

        String userData = Helper.getString(_response);

        PreferenceUtils.setUserData(userData);


        _userWholeData = UserWholeData.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));

        if (_userWholeData.data.accountVerified == false) {
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: "Success",
              subHeading: "Account not verified");
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future _getJobsInProgress({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(getInProgressJobURL,
          headers: {
            "Authorization": "Bearer " + _token,
            "DeviceID": "Device Id goes here "
          },
          body: {});

      if (_response.statusCode != 200) {
        throw ("Unauthorized");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _jobsInResponse = JobsInProgressResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        if (_jobsInResponse.data != null) {
          notifyListeners();
        }
        _inProgress = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getFutureJobResponse() {
    return this._futureJobsResponse;
  }

  getProfileData() {
    return this._profileData;
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

  void setInProgress(bool value) {
    this._inProgress = value;
    notifyListeners();
  }
}
