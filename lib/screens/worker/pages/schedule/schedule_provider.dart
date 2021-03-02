import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/RefreshToken.dart';



class ScheduleProviders extends ChangeNotifier{
  BuildContext context;
  bool value = false;
  Loader _loader = Loader();
  var connectivityResult;
  Dio dio = Dio();
  NetworkHelper _network = NetworkHelperImpl();

  init({@required BuildContext context}) {
    this.context = context;
  }

  void setToggleButton(bool value){
    this.value = !value;

  }

  Future<bool> sendShedule(Map<String,dynamic> formData,context)async{
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult != ConnectivityResult.none){
        _loader.showLoader(context: context);
        // http.Response _response = await _network.post(
        //   savePreferences,
        //   body: formData,
        //   headers: {
        //     "Content-Type": "multipart/form-data",
        //     "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
        //     "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
        //   }
        // );

        Response _response = await dio.post(
          savePreferences,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
              "DeviceID": Constants.deviceId},
          ),
        );
        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3, heading: "Error", subHeading: "Please try again");
          print(_response.data);
          return false;
          throw "Unauthorized";
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);
          Map<String,dynamic> _parsedJson = _response.data;
          if(_parsedJson["ResponseCode"] == 1){
            // return (_parsedJson["Data"])["Preferences"];
            ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Schedule updated!");
          }
          else{
            //error loading data
            print("ERROR: Response code: "+ _parsedJson["ResponseCode"].toString());
            print(_parsedJson.toString());
          }

          return true;
          } else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: "Oops",
                subHeading: "Please enter valid credentials");
            return false;
          }
        }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
  Future<bool> sendLocation(Map<String,dynamic> formData,context)async{
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult != ConnectivityResult.none){
        _loader.showLoader(context: context);
        Response _response = await dio.post(
          updateUserAddress,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
              "DeviceID": Constants.deviceId},
          ),
        );

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3, heading: "Error", subHeading: "Please try again");
          print(_response.data.toString());
          return false;
          throw "Unauthorized";
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);

          Map<String,dynamic> _parsedJson = _response.data;
          if(_parsedJson["ResponseCode"] == 1){
            ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Address updated!");
            print("Success");
          }
          else{
            //error loading data
            print("ERROR: Response code: "+ _parsedJson["ResponseCode"].toString());
          }
          return true;
        } else {
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: "Oops",
              subHeading: "Please enter valid credentials");
          return false;
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
    Future<Map<String,dynamic>> getCurrentPreferences(context) async{
      try {
        print("calling api");
        // _loader.showLoader(context: context);
        var _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
        http.Response _response = await _network.post(getData, headers: {
          "Authorization": "Bearer " + _token,
          "DeviceID": Constants.deviceId,
          "Scope":
          "preferences",
        }, body: {});

        if (_response.statusCode != 200) {
          // _loader.hideLoader(context);
          // throw ("couldn't get the data");
        }
        if (_response.statusCode == 200) {
          // _loader.hideLoader(context);
          Map<String,dynamic> _parsedJson = GenericDecodeEncode().decodeJson(_response.body.toString());

          if(_parsedJson["ResponseCode"] == 1){
            return (_parsedJson["Data"])["Preferences"];
          }
          else{
            //error loading data
            RefreshToken().refreshToken(context).then((value) => getCurrentPreferences(context));
            // return null;
          }
        }
      } catch (e) {
        // _loader.hideLoader(context);
        print(e.toString());
      }
    }
  Future<Map<String,dynamic>> getCurrentAddress(context) async{
    try {
      print("calling api");
      // _loader.showLoader(context: context);
      var _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      http.Response _response = await _network.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": Constants.deviceId,
        "Scope":
        "useraddress",
      }, body: {});

      if (_response.statusCode != 200) {
        // _loader.hideLoader(context);
        // throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        // _loader.hideLoader(context);
        Map<String,dynamic> _parsedJson = GenericDecodeEncode().decodeJson(_response.body.toString());

        if(_parsedJson["ResponseCode"] == 1){
          return (_parsedJson["Data"])["UserAddress"];
        }
        else{
          //error loading data
          return null;
        }
      }
    } catch (e) {
      // _loader.hideLoader(context);
      print(e.toString());
    }
  }


}