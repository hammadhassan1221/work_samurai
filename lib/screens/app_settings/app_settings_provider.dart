import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/app_settings/AppSettingsResponse.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/settings/settings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class AppSettingsProviders extends ChangeNotifier {
  BuildContext context;
  bool notification, darkTheme;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  List<AppSettingsParams> settingsObj;

  Loader _loader = Loader();
  String _token;

  init({@required BuildContext context}) {
    this.context = context;
    darkTheme = notification = false;
  }

  Future themeSettings({@required BuildContext context}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        _loader.showLoader(context: context);
        _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);

        List<AppSettingsParams> settingsObj = List();

        settingsObj.add(
          AppSettingsParams("Dark mode", "true"),
        );
        settingsObj.add(
          AppSettingsParams("Notification Sound", "true"),
        );

        Response _response = await _networkHelper.post(userSettingURL,
            headers: {
              "Authorization": "Bearer " + _token,
              "Content-Type": "application/json",
              "DeviceID": Constants.deviceId,
            },
            body: json.encode([
              {
                "Name": "App Settings",
                "Value": "false"
              },
            ]));

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          ApplicationToast.getErrorToast(
              durationTime: 3,
              heading: "Error",
              subHeading: "Error in updating application settings");
          throw ("Couldn't signUp");
        }
        if (_response.statusCode == 200) {
          _loader.hideLoader(context);

          AppSettingsResponse _appSettingsResponse =
              AppSettingsResponse.fromJson(
                  _genericDecodeEncode.decodeJson(Helper.getString(_response)));

          if (_appSettingsResponse.responseCode == 1) {
            ApplicationToast.getSuccessToast(
                durationTime: 3,
                heading: "",
                subHeading: "Application settings updated successfully");
          } else {
            ApplicationToast.getErrorToast(
                durationTime: 3,
                heading: "",
                subHeading: "Error! Please try again later");
          }
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}

class AppSettingsParams {
  String _name, value;

  AppSettingsParams(String name, String value) {
    this._name = name;
    this.value = value;
  }
}
