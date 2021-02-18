import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/document_verification/police_verification_model.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';


class DocumentProviders extends ChangeNotifier{
  BuildContext context;
  String _token;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  PoliceVerificationModel _policeVerificationModel = PoliceVerificationModel();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  init({@required BuildContext context}) {
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    this.context = context;
  }

  Future policeVerification(
      {@required BuildContext context}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult != ConnectivityResult.none){
        _loader.showLoader(context: context);

        Response _response = await _networkHelper.post(
          policeCheck,
          headers: {
            "Authorization": "Bearer " + _token,
            "DeviceID": Constants.deviceId,
           // "Content-Type": "multipart/form-data",
          },
        );

        if (_response.statusCode != 200) {
          _loader.hideLoader(context);
          throw "Unauthorized";
        }

        if (_response.statusCode == 200) {
          _loader.hideLoader(context);
          _policeVerificationModel = PoliceVerificationModel.fromJson(
              _genericDecodeEncode.decodeJson(Helper.getString(_response)));
          if (_policeVerificationModel.responseCode == 1){
            ApplicationToast.getSuccessToast(
                durationTime: 3,
                heading: "Success",
                subHeading: "Email Sent Successfully. Please check your email for verfication");
          }


         // Navigator.pushReplacement(context, SlideRightRoute(page: Login()));
        }
      } }catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}