import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/login_screen/login_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/utilities/utilities.dart';

import '../../widgets/loader.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  LoginResponse _loginResponse = LoginResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  init({@required BuildContext context}) {
    this.context = context;
  }

  Future _login(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {
    try {
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(
        loginURL,
        headers: {
          "Authorization": "Bearer xyfDZCB2kHdkA6yiy+HYQN0jCLMa+259Cjv4q+nQB1oelwNhUZjiAoQLO5mcnJXSDMFMLRGGpbQQKF7hOfXsWEcL4oumlH3DXIrqcQ7zY3DanF1XZKKFPCfW8UevhkL/w=",
          "Content-Type": "multipart/form-data",
        },
        body: {
          "EmailAddress": email,
          "Password": password,
          "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
        },
      );

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        ApplicationToast.getErrorToast(
            durationTime: 3, heading: "Error", subHeading: "Please try again");
        throw "Unauthorized";
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _loginResponse = LoginResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
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
        ApplicationToast.getWarningToast(
            durationTime: 3,
            heading: "Testing",
            subHeading: "email is: " + email + " and password is: " + password);
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
