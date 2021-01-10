
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:http/http.dart';
import 'package:work_samurai/widgets/toast.dart';

class AlertProviders extends ChangeNotifier{
  BuildContext _context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();

  Loader _loader = Loader();
  String _token;
  bool _isDataFetched = false;
  init({@required BuildContext context}) async{
    this._context= context;
    _isDataFetched = false;
    _token = await PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    await _getAlerts(context: context);
  }

  Future _getAlerts({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(getAlertsURL, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + _token,
        "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Alert Api Success");
        // _userWholeData = UserWholeData.fromJson(
        //     _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        // if(_userWholeData.responseCode ==1){
        //   print('Profile api called');
          _isDataFetched = true;
          notifyListeners();
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Something went wronge");
        }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  getIsDataFetched(){
    return this._isDataFetched;
  }

  setIsDataFetched({bool isFetch}){
    this._isDataFetched = isFetch;
  }

}