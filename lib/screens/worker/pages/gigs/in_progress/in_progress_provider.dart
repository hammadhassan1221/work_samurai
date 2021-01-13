
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';

class InProgressProvider extends ChangeNotifier{

  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse futureJobsResponse = FutureJobsResponse.empty();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  Dio _dio = Dio();
  bool isDataFetched = false;

  void init({BuildContext context}) async{
    this.context = context;
  }

  Future requestBreak({BuildContext context, int duration,}) async {
    try {
      _loader.showLoader(context: context);
      String token = "Bearer "+PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['Duration'] = duration;


      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        requestBreakEndPoint,
        data: formData,
        options:Options(
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
      String token = "Bearer "+PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      Response _response = await _dio.post(
        endBreakEndPoint,
        options:Options(
          headers: {
            "Authorization": token,
            "DeviceID": "Device Id goes here",
            "EncryptedDeviceID" : "",
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