import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/main.dart';
import 'package:work_samurai/models/api_models/bank_detail/bank_detail_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:http/http.dart' as http;

class CardDetailsProvider extends ChangeNotifier {
  BuildContext context;
  String _token;

  init({@required BuildContext context}) {
    this.context = context;
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
  }

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  BankDetailResponse _bankDetailResponse = BankDetailResponse.empty();
  Loader _loader = Loader();
  Dio dio = Dio();

  Future _bankDetails(
      {@required BuildContext context,
      @required String bankName,
      @required String accountHolder,
      @required String accountNumber,
      @required String bsbNum}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      connectivityResult == ConnectivityResult.none;
      if(connectivityResult != ConnectivityResult.none){
      var formData = Map<String, dynamic>();
      formData['BankName'] = "HBL";
      formData['HolderName'] = accountHolder;
      formData['BSB'] = bsbNum;
      formData['AccountNumber'] = accountNumber;
      dio.options.contentType = Headers.formUrlEncodedContentType;

      Response _response = await dio.post(
        getBankDetailURL,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer " + _token,
            "DeviceId" : "A580E6FE-DA99-4066-AFC7-C939104AED7F",
          },
        ),
      );

      if (_response.statusCode != 200) {
        ApplicationToast.getErrorToast(
            durationTime: 3, heading: "Error", subHeading: "Please try again");
        throw "Unauthorized";
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _bankDetailResponse = BankDetailResponse.fromJson(_response.data);

        ApplicationToast.getSuccessToast(
            durationTime: 3, heading: "Successfully Updated", subHeading: "");
        Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
      }
    }} catch (e) {
      print(e.toString());
    }
  }

  callBankInfoAPI({
    @required BuildContext context,
    @required String bankName,
    @required String accountHolder,
    @required String accountNumber,
    @required String bsbNum,
  }) {
    if (accountHolder.isNotEmpty) {
      if (accountNumber.isNotEmpty) {
        if (bsbNum.isNotEmpty && bsbNum.toString().length == 6) {
          _bankDetails(
              context: context,
              bankName: bankName,
              accountHolder: accountHolder,
              accountNumber: accountNumber,
              bsbNum: bsbNum);
        } else {
          ApplicationToast.getWarningToast(
              durationTime: 3,
              heading: "Error",
              subHeading: "BSB number is empty");
        }
      } else {
        ApplicationToast.getWarningToast(
            durationTime: 3,
            heading: "Error",
            subHeading: "Account number is empty");
      }
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Error",
          subHeading: "Account Holder is empty");
    }
  }
}
