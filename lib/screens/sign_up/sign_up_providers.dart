
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/login_screen/login_response.dart';
import 'package:work_samurai/models/api_models/sign_up_screen/get_app_data.dart';
import 'package:work_samurai/models/hitting_model/sign_up_screen/sign_up_model.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/utilities/utilities.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class SignUpProvider extends ChangeNotifier {
  BuildContext _context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  LoginResponse _loginResponse = LoginResponse();

  //to save ourselves from null pointer exception we initialize it with empty container
  GetAppData _appData = GetAppData.empty();
  bool isDataFetched = false;
  List<String> skills = List<String>();
  List<String> skillIDs = List<String>();
  Dio dio = Dio();

  init({@required BuildContext context}) async {
    await getAppData(context: context);
    this._context = context;
  }

  Future getAppData({
    BuildContext context,
  }) async {
    try {
      http.Response _response = await _networkHelper.post(
        getAppDataAPI,
      );

      if (_response.statusCode == 200) {
        _appData = GetAppData.fromJson(
          _genericDecodeEncode.decodeJson(
            Helper.getString(_response),
          ),
        );
        for (int i = 0; i < _appData.data.skills.length; i++) {
          for (int j = 0; j < _appData.data.skills[i].childrens.length; j++) {
            skills.add(_appData.data.skills[i].childrens[j].name);
            skillIDs.add(_appData.data.skills[i].childrens[j].id.toString());
          }
        }

        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future userSignUp({
    @required BuildContext context,
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String phone,
    @required String skill,
    @required String gender,
  }) async {
    try {
      _loader.showLoader(context: context);
      var formData = Map<String, dynamic>();
      formData['Firstname'] = firstName;
      formData['Lastname'] = lastName;
      formData['EmailAddress'] = email;
      formData['Password'] = password;
      formData['Gender'] = gender;
      formData['Mobile'] = phone;
      formData['TNCAccepted'] = true;
      formData['SkillID'] = int.parse(skill);
      dio.options.contentType = Headers.formUrlEncodedContentType;

      Response _response = await dio.post(
        signUpURL,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {"DeviceID": "Device Id goes here"},
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
        print(_loginResponse.accessToken);
        if (_loginResponse.accessToken != null){
          PreferenceUtils.setLoginResponse(_loginResponse);
          print(_loginResponse.accessToken);
          ApplicationToast.getSuccessToast(
              durationTime: 3,
              heading: "Success",
              subHeading: "Sign up successful");
          Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
        }
    }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

// Future userSignUp(
//     {@required BuildContext context,
//     @required SignUpModel signUpModel}) async {
//   try {
//     _loader.showLoader(context: context);
//     Response _response = await _networkHelper.post(
//         signUpURL, headers: {
//       "Content-Type": "multipart/form-data",
//       "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F"
//     }, body: {
//       "EmailAddress": signUpModel.emailAddress,
//       "Password": signUpModel.password,
//       "Firstname": signUpModel.firstName,
//       "Lastname": signUpModel.lastName,
//       "Salutation": signUpModel.salutation,
//       "ProfessionalTitle": signUpModel.professionalTitle,
//       "DOB": signUpModel.dob,
//       "TNCAccepted": true,
//       "Gender": signUpModel.gender,
//       "Description": signUpModel.description,
//       "Phone": signUpModel.phone,
//       "Mobile": signUpModel.mobile,
//       "SkillID": signUpModel.skillId,
//     });
//
//     if (_response.statusCode != 200) {
//       _loader.hideLoader(context);
//       ApplicationToast.getErrorToast(
//           durationTime: 3, heading: "Error", subHeading: "");
//       throw ("Couldn't signUp");
//     }
//     if (_response.statusCode == 200) {
//       _loader.hideLoader(context);
//       ApplicationToast.getSuccessToast(
//           durationTime: 3,
//           heading: "Congratulation",
//           subHeading: "User signed up successfully");
//       _loginResponse = LoginResponse.fromJson(_genericDecodeEncode.decodeJson(Helper.getString(_response)));
//
//       print(_loginResponse.accessExpiry);
//       Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
//     }
//   } catch (e) {
//     _loader.hideLoader(context);
//     print(e.toString());
//   }
// }

}
