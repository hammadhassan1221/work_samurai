import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/login_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:http/http.dart' as http;

import '../../widgets/loader.dart';
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

  Future login({@required BuildContext context, @required String email, @required String password}) async{

    Response _response = await _networkHelper.post(
      loginAPI,
      headers: {
        "Content-Type" : "multipart/form-data",
      },
      body: {
        "EmailAddress" : "email11@test.com",
        "Password" : "password",
        "DeviceID" : "A580E6FE-DA99-4066-AFC7-C939104AED7F",
      },
    );

    if(_response.statusCode !=200){
      throw "Unauthorized";
    }
    if(_response.statusCode == 200){
      _loginResponse = LoginResponse.fromJson(json.decode(_response.body.toString()));
      print(_loginResponse.accessToken);
    }
  }
}