import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/in_progress/in_progress.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class InProgressProvider extends ChangeNotifier {
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse futureJobsResponse = FutureJobsResponse.empty();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  InProgressResponse inProgressResponse = InProgressResponse.empty();
  Loader _loader = Loader();
  Dio _dio = Dio();
  bool isDataFetched = false;
  bool inProgressData = false;

  void init({BuildContext context}) async {
    isDataFetched = false;
    inProgressData = false;
    inProgressResponse = InProgressResponse.empty();
    await inProgress(
      context: context,
      jobType: 2,
    );
    this.context = context;
  }

  Future inProgress({
    BuildContext context,
    int jobType,
  }) async {
    try {
      // _loader.showLoader(context: context);
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobType'] = jobType;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        InProgressEndPoint,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": token,
            "DeviceID": Constants.deviceId,
          },
        ),
      );
      if (_response.statusCode != 200) {
        // _loader.hideLoader(context);
      }
      if (_response.statusCode == 200) {
        // _loader.hideLoader(context);
        inProgressResponse = InProgressResponse.fromJson(_response.data);
        inProgressData = true;
        notifyListeners();
      }
    } catch (e) {
      // _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future requestBreak({
    BuildContext context,
    int duration,
  }) async {
    try {
      _loader.showLoader(context: context);
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['Duration'] = 30;//duration;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        requestBreakEndPoint,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": token,
            "DeviceID": Constants.deviceId,
          },
        ),
      );
      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        if(_response.data["ResponseCode"] == 1){
          ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "Success");
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: null, subHeading: _response.data["ResponseCode"].toString() + "Can't make another request while one job request is in pending.");
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future endBreak({BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      Response _response = await _dio.post(
        endBreakEndPoint,
        options: Options(
          headers: {
            "Authorization": token,
            "DeviceID": Constants.deviceId,
            "EncryptedDeviceID": "",
          },
        ),
      );
      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        if(_response.data["ResponseCode"] == 1){
          ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "Success");
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: null, subHeading: _response.data["ResponseCode"].toString() + " sever error");
        }

      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}
