import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/login_screen/login_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:dio/dio.dart';

import 'package:work_samurai/utilities/utilities.dart';

import '../../widgets/loader.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoginResponse _loginResponse = LoginResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  Dio dio = Dio();

  init({@required BuildContext context}) {
    this.context = context;
  }

  Future _login(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {
    try {
      _loader.showLoader(context: context);
      var formData = Map<String, dynamic>();
      formData['EmailAddress'] = email;
      formData['Password'] = password;
      formData['DeviceID'] = "Device Id comes here";
      dio.options.contentType = Headers.formUrlEncodedContentType;

      Response _response = await dio.post(
        loginURL,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        ApplicationToast.getErrorToast(
            durationTime: 3, heading: "Error", subHeading: "Please try again");
        throw "Unauthorized";
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _loginResponse = LoginResponse.fromJson(_response.data);
        PreferenceUtils.setLoginResponse(_loginResponse);
        print(_loginResponse.accessToken);

        ApplicationToast.getSuccessToast(
            durationTime: 3,
            heading: "Success",
            subHeading: "Login Successfully");
        Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
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
            durationTime: 3,
            heading: "Error",
            subHeading: "Password should not be empty");
      }
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Error",
          subHeading:
              "Email should not be empty and it should be valid email address");
    }
  }
}
