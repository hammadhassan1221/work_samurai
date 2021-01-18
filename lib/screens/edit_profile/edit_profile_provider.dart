import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/generic_response/GenericResponse.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'dart:io';
import 'package:work_samurai/widgets/loader.dart';
import 'package:http_parser/http_parser.dart';

class EditProfileProviders extends ChangeNotifier {
  BuildContext context;
  File userImage ;
  final picker = ImagePicker();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  UserWholeData _userWholeData = UserWholeData();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  Dio dio = Dio();
  String _token;

  init({@required BuildContext context}) async {
    try {
      this.context = context;
      _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      await getVerifiedEmail(context: context);
      await getVerifiedPhone(context: context);
    } catch (e) {
      print(e.toString());
    }
  }
  Future getImage({@required BuildContext context}) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = image;
    } else {
      print('No image selected');
    }

    notifyListeners();
  }

  Future getVerifiedPhone(
      {@required BuildContext context, @required String newPassword}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          getVerifyPhone,
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

          GenericResponse _genericResponse =
              GenericResponse.fromJson(_response.data);
        }
      }
    } catch (e) {
      // _loader.hideLoader(context);
      print(e.toString());
    }
  }

  Future getVerifiedEmail({@required BuildContext context}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        dio.options.contentType = Headers.formUrlEncodedContentType;

        Response _response = await dio.post(
          getVerifyEmail,
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

          GenericResponse _genericResponse =
              GenericResponse.fromJson(_response.data);
        }
      }
    } catch (e) {
      // _loader.hideLoader(context);
      print(e.toString());
    }
  }
  sendUpdate( firstName, lastName,salutation,proTitle,dob,placeOfBirth,gender,description,imagePath,context) async{
    try {
      _loader.showLoader(context: context);
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
       // dio.options.contentType = Headers.formUrlEncodedContentType;
        String fileName = imagePath.toString().split("/").last;
        FormData formData;
        formData = FormData.fromMap({
          "Document.Attachment": await MultipartFile.fromFile(
            imagePath,
            filename: fileName,
            contentType: MediaType(
              "image",
              "png",
            ),
          ),
          "Firstname": firstName,
          "Lastname": lastName,
          "Salutation": salutation,
          "ProfessionalTitle": proTitle,
          "DOB": dob,
          "PlaceOfBirth": placeOfBirth,
          "Gender": gender,
          "Mobile": "012948371",
          "Description": description,
        });
        Response _response = await dio.post(
          updateProfile,
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

          GenericResponse _genericResponse =
          GenericResponse.fromJson(_response.data);
          if(_genericResponse.responseCode == 1){
            ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "data updated successfully");
          }
          else{
            ApplicationToast.getWarningToast(durationTime: 2, heading: null, subHeading: "something went wrong");
          }

        }
      }
    } catch (e) {
      // _loader.hideLoader(context);
      print(e.toString());
    }
  }
}
