import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_samurai/RefreshToken.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
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
import 'package:work_samurai/screens/login/login.dart';
class GigsProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse _futureJobsResponse = FutureJobsResponse.empty();
  JobsInProgressResponse _jobsInResponse = JobsInProgressResponse();
  UserWholeData _userWholeData = UserWholeData();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  ConnectivityResult connectivityResult;

  bool _isFutureJobsFetched = false;
  bool _inProgress = false;
  bool _profileData = false;
  String _token;

  init({@required BuildContext context}) async {
    _isFutureJobsFetched = false;
    _inProgress = false;
    _profileData = false;
    this.context = context;
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    await _getProfileData(context: context);
  }

  void setValue(RangeValues values) {
    this.values = values;
    notifyListeners();
  }


  Future _getProfileData({@required BuildContext context}) async {
    try {
      Response _response = await _networkHelper.post(
        getData,
        headers: {
          "Authorization": "Bearer " + _token,
          "DeviceID": Constants.deviceId,
          "Scope":"profile,useraddress,preferences,userskills,usersettings,userverifications,usercompliments,userrating,CompletedJobs,supporttickets,company,companyaddress,companycompliments,companyrating,verificationmethods,compliments,systemskills,AccountVerified,paymentdetails",
        },
        body: {},
      );

      if (_response.statusCode != 200) {
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        Map<String,dynamic> resultMap = _genericDecodeEncode.decodeJson(Helper.getString(_response));
        if(resultMap["ResponseCode"] == 1){
          _userWholeData = UserWholeData.fromJson(
              _genericDecodeEncode.decodeJson(Helper.getString(_response)));
          PreferenceUtils.setBool(Strings.IS_ACCOUNT_VERIFIED, _userWholeData.data.user.emailVerified);
          PreferenceUtils.setInt(Strings.USER_ID, _userWholeData.data.user.id);
        }
        else{
          if(resultMap["ResponseCode"] == 0){
            ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "Your session has expired, refreshing");
            RefreshToken().refreshToken(context).then((value) => _getProfileData(context: null));
          }
          else ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "An error has occurred!, please try later");
        }


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
