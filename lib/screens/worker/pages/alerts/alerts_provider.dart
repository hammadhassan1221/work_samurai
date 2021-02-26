
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/alerts/alerts_response.dart';
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
  AlertsResponse _alertsResponse = AlertsResponse.empty();
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
        "DeviceID": Constants.deviceId,
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _alertsResponse = AlertsResponse.fromJson(
            _genericDecodeEncode.decodeJson(_response.body));
        if(_alertsResponse.responseCode ==1){
          _isDataFetched = true;
          notifyListeners();
        }
        else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Something went wronge");
        }
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

  AlertsResponse getAlerts(){
    return this._alertsResponse;
  }

}