import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/api_models/add_document/user_verification_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';


class AddDocumentProviders extends ChangeNotifier {
  BuildContext context;
  Loader _loader = Loader();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  UserVerificationResponse _userVerificationResponse =
      UserVerificationResponse.empty();

  bool isDataFetched = false;
  List<String> skills = List<String>();

  init({@required BuildContext context}) {
    this.context = context;
  }

  Future userVerification({
    BuildContext context,
  }) async {
    try {
      http.Response _response = await _networkHelper.post(
        getUserVerificationAPI,
        headers: {
          "Authorization" : "Bearer",
          "Content-Type" : "multipart/form-data",
          "DeviceID" : "A580E6FE-DA99-4066-AFC7-C939104AED7F"
        },
        body: {
          "Description":_userVerificationResponse.data.description,
          "Name":_userVerificationResponse.data.name,
          "Verified":_userVerificationResponse.data.verified,
          "VerifiedDate":_userVerificationResponse.data.verifiedDate,
          "ExpiryDate":_userVerificationResponse.data.expiryDate,
          "Document":_userVerificationResponse.data.document,
        }
      );
      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        ApplicationToast.getErrorToast(
            durationTime: 3, heading: "Error", subHeading: "");
        throw ("Couldn't Upload Document");
      }
      // if (_response.statusCode == 200) {
      //   _userVerificationResponse = getUserVerificationAPI.fromJson(
      //     _genericDecodeEncode.decodeJson(
      //       Helper.getString(_response),
      //     ),
      //       ApplicationToast.getSuccessToast(
      //           durationTime: 3,
      //           heading: "Document Uploaded",
      //           subHeading: ""));
      //   isDataFetched = true;
      //   notifyListeners();
      // }

    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
