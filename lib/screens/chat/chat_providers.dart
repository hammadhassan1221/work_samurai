import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/chat_screen/get_all_messagesof_user_job_model.dart';
import 'package:work_samurai/models/api_models/chat_screen/get_all_user_messages_for_job.dart';
import 'package:work_samurai/models/api_models/chat_screen/send_job_messages_model.dart';
import 'package:work_samurai/models/api_models/job_messages/get_all_user_messages.dart';
import 'package:work_samurai/models/api_models/support_screen/get_support_messages.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';

class ChatProviders extends ChangeNotifier{
  BuildContext context;
  NetworkHelper _networkHelper = NetworkHelperImpl();
  //GetAllMessagesofUserJobModel getAllMessagesofUserJobModel = GetAllMessagesofUserJobModel();
  GetAllUserMessagesForJob getAllUserMessagesForJob = GetAllUserMessagesForJob();
  SendJobMessagesModel sendJobMessagesModel = SendJobMessagesModel();

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  bool isDataFetched ;
  Dio dio = Dio();
  String _token;
  int id ;

  init(BuildContext context , int jobId) async
  {
    isDataFetched = false;
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    await  getAllUserJobMessages(context: context,jobId:  jobId);
   // this.context = context;
    this.id = jobId;


    // await callSupportTicket(context: context,);
  }

  Future getAllUserJobMessages({ BuildContext context , int jobId}) async{
    try {
     // _loader.showLoader();
      var formData = Map<String, dynamic>();
      formData['JobId'] = jobId;
      dio.options.contentType = Headers.formUrlEncodedContentType;

      Response _response = await  dio.post(
        getAllJobMessages,
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
       // _loader.hideLoader(context);
        throw ("couldn't get the data");
      }

      if (_response.statusCode == 200) {
        // _loader.hideLoader(context);
        getAllUserMessagesForJob = GetAllUserMessagesForJob.fromJson(_response.data);
        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
     // _loader.hideLoader(context);
      print(e.toString());
    }
  }
  Future sendUserJobMessages({ BuildContext context , int jobId , String body}) async{
    try {
      // var formData = Map<String, dynamic>();
      // formData['SupportTicketID'] = ticketId.toString();
      // formData['Body'] = body;
      FormData formData = FormData.fromMap({

        "Body": body,
        "JobId": jobId,

      });
      Response response = await dio.post(
          sendJobMessages,
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
        sendJobMessagesModel = SendJobMessagesModel.fromJson(response.data);

        isDataFetched = true;
        FocusScope.of(context).requestFocus(FocusNode());
        notifyListeners();
      }
    } catch (e) {
     // _loader.hideLoader(context);
      print(e.toString());
    }
  }
}