import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class AccountProviders extends ChangeNotifier{
  BuildContext _context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  UserWholeData _userWholeData = UserWholeData();
  Loader _loader = Loader();
  String _token;
  bool _isDataFetched = false;

  init({@required BuildContext context}) async{
    this._context = context;
    _isDataFetched = false;
    _token = await PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    await getProfileData(context: context);
  }


  Future signout(
      {@required BuildContext context}) async {
    try{
      _loader.showLoader(context: context);
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);

      Response _response = await _networkHelper.post(
          signoutURL,
          headers: {
            "Authorization": "Bearer " + _token,
            "Content-Type" : "multipart/form-data",
            "DeviceID" : Constants.deviceId
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
        ApplicationToast.getSuccessToast(durationTime: 3, heading: "Congratulation", subHeading: "User sign out successfully");

      }
    }
    catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }

  }

  Future getProfileData({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": Constants.deviceId,
        "Scope":
        "profile,useraddress,userrating,CompletedJobs,userverifications,usercompliments",
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _userWholeData = UserWholeData.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString(Strings.USER_DATA, Helper.getString(_response));
        if(_userWholeData.responseCode ==1){
          print('Profile api called');
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
  UserWholeData getUserWholeData(){
    return this._userWholeData;
  }
}