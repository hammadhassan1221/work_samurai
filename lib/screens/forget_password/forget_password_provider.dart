import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/forget_password/forget_password_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/utilities/utilities.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  BuildContext context;
  RangeValues values;
  String _token;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  ForgetPasswordResponse _forgetPasswordResponse = ForgetPasswordResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  init({@required BuildContext context}) {
    this.context = context;
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
  }

  void setValue(RangeValues values) {
    this.values = values;
    notifyListeners();
  }

  Future _forgetPassword(
      {@required BuildContext context, @required String email}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult != ConnectivityResult.none){
      _loader.showLoader(context: context);

      Response _response = await _networkHelper.post(
        getForgetPasswordURL,
        headers: {
          "Authorization": "Bearer V6U20yUktw/QnZXR9/IBfTAntE76fiSb8f+TyKK4JEQX9+kep3QsNkBElP6QVOl83KUeZe/8ce+gHQEov+yG3U3Ob5PhRZfSwlhjYECDZEzXt3RF7DvhFbrQnLtfwB/Swn90YJaKBLSYwm19bsn0RNfTzh8R0hemwArWiVhX4jcEPZbiXMvprO7DowVGdCwhu10lH17633ZWbQSghqkOEnERV5tO56kLnvEXpCDjF382s1JeZFMK8yHWfY59p1coB4ivYOjtyJJMESp1rYzY2IEiXaS7Z+7F03bwKLAL7BViA=" /*+ _token*/,
          "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
          "Content-Type": "multipart/form-data",
        },
        body: {
          "Email": email,
        },
      );

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw "Unauthorized";
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _forgetPasswordResponse = ForgetPasswordResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        ApplicationToast.getSuccessToast(
            durationTime: 3,
            heading: "Success",
            subHeading: "Email Sent Successfully");
        Navigator.pushReplacement(context, SlideRightRoute(page: Login()));
      }
    } }catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  callForgetPasswordAPI(
      {@required BuildContext context, @required String email}) {
    if (email.toString().validateEmail()) {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Testing",
          subHeading: "email is: " + email);
      _forgetPassword(context: context, email: email);
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Error",
          subHeading:
              "Email should not be empty and it should be valid email address");
    }
  }
}
