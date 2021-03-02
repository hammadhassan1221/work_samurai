import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/models/api_models/login_screen/login_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/utilities/utilities.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../widgets/loader.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  // NetworkHelper _networkHelper = NetworkHelperImpl();
  LoginResponse _loginResponse = LoginResponse();

  // GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  var connectivityResult;

  Dio dio = Dio();

  init({@required BuildContext context}) {
    this.context = context;
  }

  Future _login(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {
    try {
      connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        _loader.showLoader(context: context);
        var formData = Map<String, dynamic>();
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        String deviceId;
        if (Platform.isAndroid) {
          deviceId = (await deviceInfo.androidInfo).androidId;
        }
        if (Platform.isIOS) {
          deviceId = (await deviceInfo.iosInfo).identifierForVendor;
        }
        String token = await FirebaseMessaging().getToken();
        formData['EmailAddress'] = email;
        formData['Password'] = password;
        formData['DeviceID'] = deviceId;
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          loginURL,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Authorization":
                  "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN),
              "FCMtoken": token,
            },
          ),
        );

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
            durationTime: 3,
            heading: "Error",
            subHeading: "Please try again",
          );
          throw "Unauthorized";
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);
          _loginResponse = LoginResponse.fromJson(_response.data);
          if (_loginResponse.accessToken != null) {
            PreferenceUtils.setLoginResponse(_loginResponse);
            print(_loginResponse.accessToken);
            ApplicationToast.getSuccessToast(
                durationTime: 3,
                heading: "Success",
                subHeading: "Login Successful");
            Navigator.pushReplacement(
              context,
              SlideRightRoute(page: Worker()),
            );
          } else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: "Oops",
                subHeading: "Please enter valid credentials");
          }
        }
      } else {
        ApplicationToast.getErrorToast(
            durationTime: 2,
            heading: null,
            subHeading: "Please check your internet connection");
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  callLoginAPI(
      {@required BuildContext context,
      @required String email,
      @required String password}) {
    if (email.toString().validateEmail()) {
      if (password.isNotEmpty) {
        _login(context: context, email: email, password: password);
      } else {
        ApplicationToast.getWarningToast(
            durationTime: 3, heading: "Error", subHeading: "Password is empty");
      }
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3, heading: "Error", subHeading: "Email is Empty");
    }
  }
}
