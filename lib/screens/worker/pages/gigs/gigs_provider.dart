import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
            ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "Your session has expired, please login again");
            PreferenceUtils.reset();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => Login()
                ),
                ModalRoute.withName("/Login")
            );
          }
          else ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "An error has occurred!, please try later");
        }


      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> refreshToken() async{
    try {
      Response _response = await _networkHelper.post(
        getAccessToken,
        headers: {
          "Authorization": "Bearer " + _token,
          "DeviceID": Constants.deviceId,
        },
        body: {
          "AccessToken": "wGR0n69gpKyzuaypMF/A9WdLOQiscnfgCFYhu6sZGi0EBmLVAQubh1n2qKOrJ04qBsIr/ez/fjrTbsF535Eod4XRNPn52hdnkUcpEZMf+zbg84BFrm7S/r34Qo1eClFHUKgB8kWlyKEKFV6egz7lI2GSjFp3JhD/hauvc0b0rWUQOnIWWPJGdXqT8H1B9+p3lsfJ52qiWvB/w8F8NxtIvt8Gkk0F98CyDzV+bxWt6Xv00d3r5CP5UK+95k+L37rFDA63kemWXSwQYwsH6LGExLj4WhzMV3CmYv2f0Gdc4wcSE=",
          "AccessExpiry": "2020-12-19T23:00:10.6382027",
          "RefreshToken": "BZUwOnUvlYCj0qwkWEbSS2zlKI8IjYhIg8NCUxC0NDsIIwlrfhGesg4TbGrKfwsGS2s76YVhnZNGdPJmPOM8xczY6DR2otg+xKJDTkaFX0kTNRXgSV7yAkHEpK1izdmxAiBUH9sgmd0stpsZc/dJgRpJZHr2vYzqbVIFqkPyEYio=",
          "RefreshExpiry": "2021-02-19T23:00:10.6382027",
          "TokenResponse": 1
        },
      );

      if (_response.statusCode != 200) {
        // throw ("couldn't get the data");
        ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "SERVER NOT RESPONDING");
      }
      if (_response.statusCode == 200) {
        Map<String,dynamic> resultMap = _genericDecodeEncode.decodeJson(Helper.getString(_response));
        if(resultMap["TokenResponse"] == 1){
          // Map<String,dynamic> resultMap = _genericDecodeEncode.decodeJson(Helper.getString(_response));
          PreferenceUtils.setString(Strings.ACCESS_TOKEN, resultMap["AccessToken"] ?? "");
          PreferenceUtils.setString(Strings.ACCESS_EXPIRY, resultMap["AccessExpiry"] ?? "");
          PreferenceUtils.setString(Strings.ACCESS_TOKEN, resultMap["RefreshToken"] ?? "");
          PreferenceUtils.setString(Strings.ACCESS_TOKEN, resultMap["RefreshExpiry"] ?? "");
        }
        else{
          if(resultMap["TokenResponse"] == 0){
            ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "Your session has expired, please login again");
            PreferenceUtils.reset();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => Login()
                ),
                ModalRoute.withName("/Login")
            );
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
