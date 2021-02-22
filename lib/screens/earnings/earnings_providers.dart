import 'package:flutter/cupertino.dart';

import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/earning_screen/earning_response_model.dart';
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
  EarningResponseModel earning = EarningResponseModel();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  var connectivityResult;
  // var myFormat1 = DateFormat('dd-MM-yyyy');
  // var selectedDate = DateTime.now();
  // var fromDate = DateTime.now().add(Duration(days: 7));
  Dio dio = Dio();
  var isUpdated = false;
  NetworkHelper _network = NetworkHelperImpl();

  init({@required fromDate, @required toDate ,@required BuildContext context}) {
    this.context = context;
    getUserEarnings1(fromDate: fromDate , toDate: toDate , context: context);
  }
  String swapMonthWithDay(String date){
    String day = date.substring(0,2);
    String month = date.substring(3,5);
    String year = date.substring(6,10);
    return "$day/$month/$year";
  }
  Future getUserEarnings1({@required BuildContext context , @required String fromDate, @required String toDate}) async{
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        _loader.showLoader(context: context);
        var formData = Map<String, dynamic>();
        formData["FromDate"] = swapMonthWithDay(fromDate);
        formData["ToDate"] = swapMonthWithDay(toDate);
        print(formData.toString());
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          getUsersEarning,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
              "DeviceID": Constants.deviceId,
            },
          ),
        );

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          throw ("couldn't get the data");
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);


          if (_response.statusCode == 200) {

            earning = EarningResponseModel.fromJson(_response.data);

            if (earning.responseCode == 1){
              ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Successfully got earnings");
              isUpdated = true;
              notifyListeners();
            }
            else if (earning.responseCode == 34) {
              ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "no earnings");
              notifyListeners();
            }
          }
          // GenericResponse _genericResponse = GenericResponse.fromJson(_response.data);
          // ApplicationToast.getSuccessToast(
          //     durationTime: 3,
          //     heading: "Success",
          //     subHeading: "Ticket Generated");
          // Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
        }
      }
    }catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }
  }


  // Future getUserEarnings(String fromDate, String toDate,context) async{
  //
  //   Map<String,dynamic> formData = Map<String, dynamic>();
  //
  //   formData["FromDate"] = 9;//"15/01/2021";
  //   formData["ToDate"] = 0; //"21/01/2021";
  //   print(formData.toString());
  //   try {
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if(connectivityResult != ConnectivityResult.none){
  //       _loader.showLoader(context: context);
  //       Response _response = await dio.post(
  //         getUsersEarning,
  //         data: formData,
  //         options: Options(
  //           contentType: Headers.formUrlEncodedContentType,
  //           headers: {
  //             "Content-Type": "multipart/form-data",
  //             "Authorization": "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
  //             "DeviceID": Constants.deviceId,
  //           },
  //         ),
  //       );
  //       if (_response.statusCode != 200) {
  //         ApplicationToast.getErrorToast(
  //             durationTime: 3, heading: "Error", subHeading: "Please try again");
  //         return null;
  //       }
  //       if (_response.statusCode == 200) {
  //         _loader.hideLoader(context);
  //
  //           earning = EarningResponseModel.fromJson(_response.data);
  //           print(earning.responseCode);
  //           // Navigator.push(context, SlideRightRoute(page: EarningsDetails()));
  //           isUpdated = true;
  //
  //
  //         print(_response.data.toString());
  //
  //         return earning;
  //       } else {
  //         ApplicationToast.getErrorToast(
  //             durationTime: 3,
  //             heading: "Oops",
  //             subHeading: "Please enter valid credentials");
  //         return null;
  //       }
  //     }
  //   } catch (e) {
  //     _loader.hideLoader(context);
  //     ApplicationToast.getErrorToast(
  //         durationTime: 3,
  //         heading: "Oops",
  //         subHeading: "Please enter valid credentials");
  //     print(e.toString());
  //   }
  //
  // }

}