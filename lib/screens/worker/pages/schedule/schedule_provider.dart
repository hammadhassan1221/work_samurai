import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:http/http.dart' as http;

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
        http.Response _response = await _network.post(
          savePreferences,
          body: formData,
          headers: {
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
            "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
          }
        );

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3, heading: "Error", subHeading: "Please try again");
          print(_response.body);
          return false;
          throw "Unauthorized";
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);
          ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Schedule updated!");
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
        http.Response _response = await _network.post(
            updateUserAddress,
            body: formData,
            headers: {
              "Content-Type": "multipart/form-data",
              "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
              "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
            }
        );

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3, heading: "Error", subHeading: "Please try again");
          print(_response.body);
          return false;
          throw "Unauthorized";
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);
          ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Address updated!");
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
}