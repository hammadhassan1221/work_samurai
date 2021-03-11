import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/jobs_in_progress_response.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/widgets/toast.dart';

class SplashProvider extends ChangeNotifier {
  String versionNumber="";

  BuildContext context;
  FirebaseMessaging _fcm = FirebaseMessaging();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  FutureJobsResponse _futureJobsResponse = FutureJobsResponse.empty();
  JobsInProgressResponse _jobsInResponse = JobsInProgressResponse();
  UserWholeData _userWholeData = UserWholeData();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  DeviceInfoPlugin devicInfo = DeviceInfoPlugin();
  bool loading = true;

  init({@required BuildContext context}) async{
    this.context = context;
    await getDeviceInfo();
    await _getVersionNumber();
    getToken();


  }


  void getToken()async{

    final token = await _fcm.getToken();
    debugPrint('$token');

    if(token != null && token.isNotEmpty){
      PreferenceUtils.setString(Strings.FCM_TOKEN, token);
      navigateToNextRoute(context);
    }
    else{
      debugPrint('$token');
      navigateToNextRoute(context);
    }
  }

  initializeResources(BuildContext context) {
    AppSizes.initializeSize(context);
  }

  Future<void> _getVersionNumber() async {
    try {
      versionNumber = await GetVersion.platformVersion;
    } on PlatformException {
      versionNumber = 'Failed to get project version.';
    }
    notifyListeners();
  }

  void navigateToNextRoute(BuildContext context) async {
    await Future.delayed(Duration(
      seconds: 5,
    ));

    if (PreferenceUtils.getBoolean(Strings.IS_LOGGED_IN) == true) {
      Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
    } else {
      Navigator.pushReplacement(context, SlideRightRoute(page: Login()));
    }
  }

   Future  getDeviceInfo() async {
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await devicInfo.iosInfo;
      print(iosInfo.name);
      //print(iosInfo.systemVersion);
      print(iosInfo.localizedModel);
      print(iosInfo.model);
      print(iosInfo.identifierForVendor);
      await PreferenceUtils.setString(Strings.DEVICE_ID, iosInfo.identifierForVendor);
      Constants.deviceId = PreferenceUtils.getString(Strings.DEVICE_ID);
    } else {
      AndroidDeviceInfo deviceInfo = await devicInfo.androidInfo;
      print(deviceInfo.androidId);
      print(deviceInfo.brand);
      print(deviceInfo.manufacturer);
      var deviceId = (deviceInfo.androidId);
      await PreferenceUtils.setString(Strings.DEVICE_ID, deviceId );
      Constants.deviceId = PreferenceUtils.getString(Strings.DEVICE_ID);
      String aa = "aaa";

    }
  }
}
