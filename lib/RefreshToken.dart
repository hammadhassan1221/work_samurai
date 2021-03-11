import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/widgets/toast.dart';

class RefreshToken{
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  String _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);

  Future<void> refreshToken(BuildContext context) async{
    try {
      Response _response = await _networkHelper.post(
        getAccessToken,
        headers: {
          "Authorization": "Bearer " + _token,
          "DeviceID": Constants.deviceId,
          "Content-Type": "application/json",
        },
        body: {
          "AccessToken": PreferenceUtils.getString(Strings.ACCESS_TOKEN),
          "AccessExpiry": PreferenceUtils.getString(Strings.ACCESS_EXPIRY),
          "RefreshToken": PreferenceUtils.getString(Strings.REFRESH_TOKEN),
          "RefreshExpiry": PreferenceUtils.getString(Strings.REFRESH_EXPIRY),
          "TokenResponse": 1
        },
      );

      if (_response.statusCode != 200) {
        // throw ("couldn't get the data");
        ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "SERVER NOT RESPONDING "+ _response.body);
        return;
      }
      if (_response.statusCode == 200) {
        Map<String,dynamic> resultMap = _genericDecodeEncode.decodeJson(Helper.getString(_response));
        if(resultMap["TokenResponse"] == 1){
          PreferenceUtils.setString(Strings.ACCESS_TOKEN, resultMap["AccessToken"] ?? "");
          PreferenceUtils.setString(Strings.ACCESS_EXPIRY, resultMap["AccessExpiry"] ?? "");
          PreferenceUtils.setString(Strings.ACCESS_TOKEN, resultMap["RefreshToken"] ?? "");
          PreferenceUtils.setString(Strings.ACCESS_TOKEN, resultMap["RefreshExpiry"] ?? "");
          return;
        }
        else{
          if(resultMap["TokenResponse"] == 0){
            // ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "please login again");
            // PreferenceUtils.reset();
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Login()
            //     ),
            //     ModalRoute.withName("/Login")
            // );
          }
          else ApplicationToast.getErrorToast(durationTime: 3, heading: "ERROR", subHeading: "An error has occurred!, please try later");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}