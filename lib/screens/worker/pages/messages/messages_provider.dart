import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/job_messages/get_all_user_messages.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';

class MessageProviders extends ChangeNotifier{
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GetAllUserMessages getAllUserMessages = GetAllUserMessages();

  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  bool isDataFetched ;
  Dio dio = Dio();
  String _token;
  int id ;

  init({@required BuildContext context}) async {
    isDataFetched = false;
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    await  getSupportMessages(context: context);
    this.context = context;
  }

  Future getSupportMessages({ BuildContext context , int ticketId}) async{
    try {
      dio.options.contentType = Headers.formUrlEncodedContentType;

      Response _response = await  dio.post(
        getAllUserMessage,
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
        getAllUserMessages = GetAllUserMessages.fromJson(_response.data);
        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}