
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/add_document/user_verification_response.dart';
import 'package:work_samurai/models/api_models/add_document_verifications/add_document_verification_response.dart';
import 'package:work_samurai/models/api_models/verification_methods/verfication_methods_response.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

import 'add_document.dart';


class AddDocumentProviders extends ChangeNotifier {
  BuildContext context;
  Loader _loader = Loader();
  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  UserVerificationResponse _userVerificationResponse = UserVerificationResponse.empty();
  AddDocumentVerificationResponse _documentVerificationResponse = AddDocumentVerificationResponse.empty();
  VerficationMethodsResponse _verficationMethodsResponse = VerficationMethodsResponse.empty();
  bool _isDataFetched = false;
  List<String> skills = List<String>();
  File file;
  FilePickerResult result;
  String _token;
  Dio _dio = Dio();
  bool _isPicked = false;
  List<dynamic> dataList = List<dynamic>();
  
  init({@required BuildContext context}) async{
    this.context = context;
    _isPicked = false;
    dataList = [];
    _token = await PreferenceUtils.getString(Strings.ACCESS_TOKEN);
    result = null;
    file = null;
    await _getVerificationMethods(context: context);

  }

  pickFile () async{
    result = null;
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],);
    if(result != null) {
      file = File(result.files.single.path);
      _isPicked = true;
      ApplicationToast.getSuccessToast(durationTime: 2, heading: "success", subHeading: "File Atttached Successfully");
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }


  Future onUploadDocument({
    @required BuildContext context,
    @required String desc,
    @required int systemUserId,
    @required String verificationMethodId,
  }) async {
    try {
      if(verificationMethodId == null){
        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Please Select Verification Type");
      }
      else if(desc.isEmpty){
        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Please Enter Description");
      }
      else if(file == null){
        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Please Attech Document");
      }
      else{
        String fileName = file.path.split("/").last;
        if (fileName.length >= 41) {
          fileName = fileName.substring(fileName.length - 40);
        }
        _loader.showLoader(context: context);
        FormData formData = FormData.fromMap({
          "Document.Attachment": await MultipartFile.fromFile(
            result.files[0].path,
            filename: fileName,
            contentType: MediaType(
              "image",
              "jpg",
            ),
          ),
          "SystemUserID": systemUserId,
          "VerificationMethodID": verificationMethodId,
          "Document.Description": desc,

        });
        Response response = await _dio.post(
            addDocumentVerificationURL,
            data: formData,
            options: Options(
                headers: {
                  "contentType":"multipart/form-data",
                  "Authorization": "Bearer " + _token,
                  "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
                })
        );

        if (response.statusCode != 200) {
          _loader.hideLoader(context);
          throw ("couldn't get the data");
        }
        if (response.statusCode == 200) {
          _loader.hideLoader(context);
          if(response.data['Data'] !=null){
            _documentVerificationResponse = AddDocumentVerificationResponse.fromJson(response.data);
            ApplicationToast.getSuccessToast(durationTime: 3, heading: "Added", subHeading: "Successfully added record");
            Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
          }else{
            ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "No Data found");
          }
        }
      }

    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }

  getIsPicked(){
    return this._isPicked;
  }


  Future _getVerificationMethods({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      http.Response _response = await _networkHelper.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
        "Scope":
        "verificationmethods",
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        _verficationMethodsResponse = VerficationMethodsResponse.fromJson(
            _genericDecodeEncode.decodeJson(_response.body));
        if(_verficationMethodsResponse.responseCode ==1){
          print('Verification Methods api called');
          print(_verficationMethodsResponse.data.verificationMethods[0]);

          for(int i = 0; i < _verficationMethodsResponse.data.verificationMethods.length; i++){
            dataList.add(_verficationMethodsResponse.data.verificationMethods[i]);
          }
          // print(data[0].na)

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
  VerficationMethodsResponse getVerificationMethods(){
    return this._verficationMethodsResponse;
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
