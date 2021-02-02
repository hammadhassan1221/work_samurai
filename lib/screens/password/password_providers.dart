import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/password/new_password.dart';
import 'package:work_samurai/models/generic_response/GenericResponse.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class PasswordProviders extends ChangeNotifier{
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  UserWholeData _userWholeData = UserWholeData();
  NewPasswordResponse _newPasswordResponse = NewPasswordResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  Dio dio = Dio();
  String _token;

  init({@required BuildContext context})async {
    try {
      this.context = context;
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
     // await callPasswordAPI(context: context,);

    } catch (e) {
      print(e.toString());
    }
  }

  Future _newPassword({@required BuildContext context,@required String newPassword,})async{
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        _loader.showLoader(context: context);
        var formData = Map<String, dynamic>();
        formData['NewPassword'] = newPassword;
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          getNewPassword,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Authorization": "Bearer " + _token,
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

          GenericResponse _genericResponse = GenericResponse.fromJson(_response.data);
          ApplicationToast.getSuccessToast(
              durationTime: 3,
              heading: "Success",
              subHeading: "Login Successful");
          Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
        }
      }
    }catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  callPasswordAPI({
    @required BuildContext context,
    @required String confirmPassword,
    @required String newPassword,
    @required String currentPassword,
  }) {
   _newPassword(context: context, newPassword: newPassword);
  }

}