import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/in_progress/in_progress.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';

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
      _loader.showLoader(context: context);
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
            "DeviceID": "Device Id goes here",
          },
        ),
      );
      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        inProgressResponse = InProgressResponse.fromJson(_response.data);
        inProgressData = true;
        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
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
      formData['Duration'] = duration;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        requestBreakEndPoint,
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
            "DeviceID": "Device Id goes here",
            "EncryptedDeviceID": "",
          },
        ),
      );
      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}
