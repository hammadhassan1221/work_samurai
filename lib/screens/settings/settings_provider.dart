import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/screens/worker/pages/account/account_provider.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class SettingsProviders extends ChangeNotifier{
  BuildContext _context;
  init({@required BuildContext context}) {
    this._context = context;

  }

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  String _token;
  AccountProviders _accountProviders;


  Future signout(
      {@required BuildContext context}) async {
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      connectivityResult == ConnectivityResult.none;
      if(connectivityResult != ConnectivityResult.none){
      _loader.showLoader(context: context);
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);

      Response _response = await _networkHelper.post(
          signoutURL,
          headers: {
            "Authorization": "Bearer " + _token,
            "Content-Type" : "multipart/form-data",
            "DeviceID" : Constants.deviceId,
          },
          body: {
          }
      );


      if(_response.statusCode != 200){
        _loader.hideLoader(context);
        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "");
        throw("Couldn't signUp");
      }
      if(_response.statusCode == 200){
        _loader.hideLoader(context);
        PreferenceUtils.reset();


        Navigator.push(_context, SlideRightRoute(page: Login()));
        ApplicationToast.getSuccessToast(durationTime: 3, heading: "", subHeading: "Sign Out Successful");

      }
    }}
    catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }

  }
}