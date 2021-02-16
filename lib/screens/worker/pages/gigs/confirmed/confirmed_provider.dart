import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/models/api_models/in_progress/in_progress.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class ConfirmedProvider{
  Loader _loader = Loader();
  Dio _dio = Dio();

  Future<InProgressResponse>getConfirmedJobs(context, ) async {
    try {
      _loader.showLoader(context: context);
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobType'] = 3;

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
        _loader.hideLoader(context);
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        if(_response.data["ResponseCode"] == 1){
          return InProgressResponse.fromJson(_response.data);
        }
        else return null;
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }

  }
  leaveForJob(context, int jobId) async {
    try {
      _loader.showLoader(context: context);
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobId'] = jobId;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        leaveForJobEndPoint,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": token,
            "DeviceID": "Device Id goes here",
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
          ApplicationToast.getErrorToast(durationTime: 3, heading: null, subHeading: "error try again later!");
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
  rejectJob(context, int jobId) async {
    try {
      _loader.showLoader(context: context);
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobId'] = jobId;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        rejectJobEndPoint,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": token,
            "DeviceID": "Device Id goes here",
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
          ApplicationToast.getErrorToast(durationTime: 3, heading: null, subHeading: "error try again later!");
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}