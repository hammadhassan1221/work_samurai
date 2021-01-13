import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/support_screen/create_support_ticket_model.dart';
import 'package:work_samurai/models/api_models/support_screen/get_support_messages.dart';
import 'package:work_samurai/models/api_models/support_screen/get_support_tickets.dart';
import 'package:work_samurai/models/api_models/support_screen/send_support_message_model.dart';
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

class SupportMessagesProvider extends ChangeNotifier {

  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GetSupportMessages getSupportMessage = GetSupportMessages();
  SendSupportMessageModel sendSupportMessageModel = SendSupportMessageModel();
 // UserWholeData _userWholeData = UserWholeData();
 // SupportTicketResponse _supportTicketResponse = SupportTicketResponse();
 // SupportTicketsModel supportTicketsModel = SupportTicketsModel();
 // CreateSupportTicketModel _createSupportTicketModel = CreateSupportTicketModel();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  bool isDataFetched ;
  Dio dio = Dio();
  String _token;
  int id ;

  init(BuildContext context , int ticketId) async
  {
    isDataFetched = false;
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
        await  getSupportMessages(context: context,ticketId:  ticketId);
        this.context = context;
         this.id = ticketId;


      // await callSupportTicket(context: context,);
  }

    Future getSupportMessages({ BuildContext context , int ticketId}) async{
    try {
      var formData = Map<String, dynamic>();
            formData['ID'] = ticketId;
            dio.options.contentType = Headers.formUrlEncodedContentType;

            Response _response = await  dio.post(
              getTicketMessages,
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
       // _loader.hideLoader(context);
        throw ("couldn't get the data");
      }

      if (_response.statusCode == 200) {
       // _loader.hideLoader(context);
        getSupportMessage = GetSupportMessages.fromJson(_response.data);
        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
  Future sendSupportMessages({ BuildContext context , int ticketId , String body}) async{
    try {
      // var formData = Map<String, dynamic>();
      // formData['SupportTicketID'] = ticketId.toString();
      // formData['Body'] = body;
      FormData formData = FormData.fromMap({

        "Body": body,
        "SupportTicketID": ticketId,

      });
      Response response = await dio.post(
          sendSupportMessage,
          data: formData,
          options: Options(
              headers: {
                "contentType":"multipart/form-data",
                "Authorization": "Bearer " + _token,
                "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
              })
      );

      if (response.statusCode != 200) {
        // _loader.hideLoader(context);
        throw ("couldn't get the data");
      }

      if (response.statusCode == 200) {
        // _loader.hideLoader(context);
        sendSupportMessageModel = SendSupportMessageModel.fromJson(response.data);

        isDataFetched = true;
        FocusScope.of(context).requestFocus(FocusNode());
        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
  //Future supportTicket({@required BuildContext context , @required String supportTicket})async{
  //   try{
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     if (connectivityResult != ConnectivityResult.none) {
  //       _loader.showLoader(context: context);
  //       var formData = Map<String, dynamic>();
  //       formData['Title'] = supportTicket;
  //       dio.options.contentType = Headers.formUrlEncodedContentType;
  //
  //       Response _response = await dio.post(
  //         getSupportTicket,
  //         data: formData,
  //         options: Options(
  //           contentType: Headers.formUrlEncodedContentType,
  //           headers: {
  //             "Authorization": "Bearer " + _token,
  //             "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
  //           },
  //         ),
  //       );
  //
  //       if (_response.statusCode != 200) {
  //         _loader.hideLoader(context);
  //         throw ("couldn't get the data");
  //       }
  //       if (_response.statusCode == 200) {
  //         _loader.hideLoader(context);
  //
  //
  //         if (_response.statusCode == 200) {
  //           _loader.hideLoader(context);
  //           _createSupportTicketModel = CreateSupportTicketModel.fromJson(_response.data);
  //           isDataFetched = true;
  //           if (_createSupportTicketModel.responseCode == 1){
  //             ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Successfully created Token");
  //             notifyListeners();
  //           }
  //           else if (_createSupportTicketModel.responseCode == 34) {
  //             ApplicationToast.getSuccessToast(durationTime: 3, heading: "Success", subHeading: "Token Already created");
  //             notifyListeners();
  //           }
  //         }
          // GenericResponse _genericResponse = GenericResponse.fromJson(_response.data);
          // ApplicationToast.getSuccessToast(
          //     durationTime: 3,
          //     heading: "Success",
          //     subHeading: "Ticket Generated");
          // Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
     //   }
 //     }
 //    }catch(e){
 //      _loader.hideLoader(context);
 //      print(e.toString());
 //    }
 // }

}