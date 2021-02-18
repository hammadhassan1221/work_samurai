import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/support_screen/create_support_ticket_model.dart';
import 'package:work_samurai/models/api_models/support_screen/get_support_tickets.dart';
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
import 'package:http/http.dart' as http;

class SupportProviders extends ChangeNotifier {

  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  UserWholeData _userWholeData = UserWholeData();
  SupportTicketResponse _supportTicketResponse = SupportTicketResponse();
  SupportTicketsModel supportTicketsModel = SupportTicketsModel();
  CreateSupportTicketModel _createSupportTicketModel = CreateSupportTicketModel();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  bool isDataFetched ;
  Dio dio = Dio();
  String _token;

  init({@required BuildContext context}) async
  {
    try {
      this.context = context;
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      await getSupportTickets(context: context);
      // await callSupportTicket(context: context,);
    } catch (e) {
      print(e.toString());
    }
  }

  Future getSupportTickets({@required BuildContext context}) async {
    try {
    //  _loader.showLoader(context: context);
      http.Response _response = await _networkHelper.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": Constants.deviceId,
        "Scope": "supporttickets",
      }, body: {});

      if (_response.statusCode != 200) {
       // _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
       // _loader.hideLoader(context);
        supportTicketsModel = SupportTicketsModel.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
     // _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future supportTicket({@required BuildContext context , @required String supportTicket})async{
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        _loader.showLoader(context: context);
        var formData = Map<String, dynamic>();
        formData['Title'] = supportTicket;
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          getSupportTicket,
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


          if (_response.statusCode == 200) {
            _loader.hideLoader(context);
            _createSupportTicketModel = CreateSupportTicketModel.fromJson(_response.data);
            isDataFetched = true;
            if (_createSupportTicketModel.responseCode == 1){
              ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Successfully created Token");
              notifyListeners();
            }
            else if (_createSupportTicketModel.responseCode == 34) {
              ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Token Already created");
              notifyListeners();
            }
          }
          // GenericResponse _genericResponse = GenericResponse.fromJson(_response.data);
          // ApplicationToast.getSuccessToast(
          //     durationTime: 3,
          //     heading: "Success",
          //     subHeading: "Ticket Generated");
          // Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
        }
      }
    }catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  // callSupportTicket({@required BuildContext context,
  //   @required String supportTicket,}) {
  //   if (supportTicket.isNotEmpty) {
  //     _supportTicket(context: context, title: supportTicket,);
  //   } else {
  //     ApplicationToast.getSupportTicketToast(
  //         context: context, text: "Ticket Generated", onNavigate: () {});
  //   }
  // }
}