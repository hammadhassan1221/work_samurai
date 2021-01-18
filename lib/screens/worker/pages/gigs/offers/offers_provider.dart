import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/widgets/toast.dart';

class OffersProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse futureJobsResponse = FutureJobsResponse.empty();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  Dio _dio = Dio();
  bool isDataFetched = false;
  int pageNumber = 0;
  static const _pageSize = 50;
  int pageCount = 10;


  Future initialize({BuildContext context}) async {
    futureJobsResponse = FutureJobsResponse.empty();
    isDataFetched = false;
    this.pageNumber = 0;
  }

  Future getFutureJobs({int jobType, int pageSize, int pageNumber}) async {
    try {
      this.pageNumber = pageNumber;
      String token = "Bearer "+PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobType'] = jobType;
      formData['PageSize'] = pageSize;
      formData['PageNumber'] = pageNumber;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        getJobByType,
        data: formData,
        options:Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": token,
            "DeviceID": "Device Id goes here",
          },
        ),
      );
      if (_response.statusCode != 200) {}
      if (_response.statusCode == 200) {
        if(_response.data["Data"].length < _pageSize){
          FutureJobsResponse temp = FutureJobsResponse.empty();
          pageCount = pageCount + temp.data.length;
          temp = FutureJobsResponse.fromJson(_response.data);
          futureJobsResponse.data.addAll(temp.data);
          if (futureJobsResponse.data != null) {
            isDataFetched = true;
            notifyListeners();
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  int getPageNumber(){
    return this.pageNumber;
  }

  Future acceptJob({BuildContext context,int jobId}) async {
    try {
      _loader.showLoader(context: context);
      String token = "Bearer "+PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobID'] = jobId;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        acceptJobEndPoint,
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

  Future rejectJob({BuildContext context,int jobId}) async {
    try {
      _loader.showLoader(context: context);
      String token = "Bearer "+PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobID'] = 1014;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        rejectJobEndPoint,
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
