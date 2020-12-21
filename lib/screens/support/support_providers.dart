import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/support_screen/support_screen.dart';
import 'package:work_samurai/models/generic_response/GenericResponse.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';

class SupportProviders extends ChangeNotifier{

  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  UserWholeData _userWholeData = UserWholeData();
  SupportTicketResponse _supportTicketResponse = SupportTicketResponse();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();

  Dio dio = Dio();
  String _token;

  init({@required BuildContext context}) async
  {
    try {
      this.context = context;
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      await callSupportTicket(context: context,);
    } catch (e) {
      print(e.toString());
    }
  }

  Future _supportTicket({@required BuildContext context , @required String title})async{
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        _loader.showLoader(context: context);
        var formData = Map<String, dynamic>();
        formData['Title'] = title;
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          getSupportTicket,
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: {
              "Authorization": "Bearer " + _token,
              "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
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
              subHeading: "Ticket Generated");
          Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
        }
      }
    }catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  callSupportTicket({@required BuildContext context,
    @required String supportTicket,}) {
    if (supportTicket.isNotEmpty) {
      _supportTicket(context: context, title: supportTicket,);
    } else {
      ApplicationToast.getSupportTicketToast(
          context: context, text: "Ticket Generated", onNavigate: () {});
    }
  }}