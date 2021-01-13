import 'package:flutter/cupertino.dart';

import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/models/api_models/earning_screen/earning_response.dart';
import 'package:dio/dio.dart';
import 'package:work_samurai/screens/earning_details/earning_details.dart';
import 'package:intl/intl.dart';
import 'package:work_samurai/animations/slide_right.dart';


import 'package:connectivity/connectivity.dart';


class EarningProviders extends ChangeNotifier{
  BuildContext context;
  Loader _loader = Loader();
  var connectivityResult;
  Dio dio = Dio();

  NetworkHelper _network = NetworkHelperImpl();

  init({@required BuildContext context}) {
    this.context = context;
  }
  String swapMonthWithDay(String date){
    String month = date.substring(0,2);
    String day = date.substring(3,5);
    String year = date.substring(6,10);
    return "$day/$month/$year";
  }

  Future<EarningResponse> getUserEarning(String fromDate, String toDate,context) async{

    Map<String,dynamic> formData = Map<String, dynamic>();
    formData["FromDate"] = swapMonthWithDay(fromDate);
    formData["ToDate"] = swapMonthWithDay(toDate);
    print(formData.toString());
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult != ConnectivityResult.none){
        _loader.showLoader(context: context);
        Response _response = await dio.post(
          getUserEarnings,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Content-Type": "multipart/form-data",
              "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
              "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
            },
          ),
        );
        if (_response.statusCode != 200) {
          ApplicationToast.getErrorToast(
              durationTime: 3, heading: "Error", subHeading: "Please try again");
          return null;
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);
          EarningResponse earning;
          if(_response.data["ResponseCode"] == 1){
            earning = EarningResponse.fromJson(_response.data["Data"]);
            // Navigator.push(context, SlideRightRoute(page: EarningsDetails()));
          }


          print(_response.data.toString());
          return earning;
        } else {
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: "Oops",
              subHeading: "Please enter valid credentials");
          return null;
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }

  }

}