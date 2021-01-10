//import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/jobRoles/add_user_skills.dart';
import 'package:work_samurai/models/api_models/jobRoles/get_system_skills_response.dart';
import 'package:work_samurai/models/api_models/jobRoles/get_user_skillls_response.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:work_samurai/widgets/toast.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
class JobRolesProviders extends ChangeNotifier{
  BuildContext context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GetUserSkilllsResponse getUserSkilllsResponse = GetUserSkilllsResponse();
  GetSystemSkillsResponse getSystemSkillsResponse = GetSystemSkillsResponse();
  AddUserSkillResponse addUserSkillsResponse = AddUserSkillResponse.empty();
  UserWholeData _userWholeData = UserWholeData();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  bool isDataFetched = false;
  String _token;
  FilePickerResult result;
  List<String> skills = List<String>();
  List<String> skillIDs = List<String>();
  Dio _dio = Dio();
  File file;


  init(BuildContext context) async{
    this.context = context;
    skills = [];
    _token = PreferenceUtils.getString(Strings.ACCESS_TOKEN);
   await _getUserkills(context: context);
   await _getSystemSkills(context: context);
    result = null;
  }
  pickFile () async{
    result = null;
    result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],);
    if(result != null) {
      file = File(result.files.single.path);
      ApplicationToast.getSuccessToast(durationTime: 2, heading: "success", subHeading: "File Atttached Successfully");
       notifyListeners();
    } else {
      // User canceled the picker
    }
  }
  Future _getUserkills({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      http.Response _response = await _networkHelper.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
        "Scope": "userskills",
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        getUserSkilllsResponse = GetUserSkilllsResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
  Future _getSystemSkills({@required BuildContext context}) async {
    try {
      _loader.showLoader(context: context);
      http.Response _response = await _networkHelper.post(getData, headers: {
        "Authorization": "Bearer " + _token,
        "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
        "Scope": "systemskills",
      }, body: {});

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);
        getSystemSkillsResponse = GetSystemSkillsResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response)));
        for (int i = 0; i < getSystemSkillsResponse.data.systemSkills.length; i++) {
          for (int j = 0; j < getSystemSkillsResponse.data.systemSkills[i].childrens.length; j++) {
            skills.add(getSystemSkillsResponse.data.systemSkills[i].childrens[j].name);
            skillIDs.add(getSystemSkillsResponse.data.systemSkills[i].childrens[j].id.toString());
          }
        }
        isDataFetched = true;
        notifyListeners();
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
  Future addUserSkill({@required BuildContext context, @required desc, @required userSkillId}) async {
    try {
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
        "SkillID": userSkillId,
        "Document.Description": desc,

      });
      Response response = await _dio.post(
        addUserSkillUrl,
        data: formData,
        options: Options(
          headers: {
            "contentType":"multipart/form-data",
            "Authorization": "Bearer " + _token,
            "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
          })
      );


      // Response _response = await _networkHelper.post(getData, headers: {
      //   "Authorization": "Bearer " + _token,
      //   "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
      //   "Scope": "systemskills",
      // }, body: {});

      if (response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (response.statusCode == 200) {
        _loader.hideLoader(context);
        if(response.data['Data'] !=null){
          addUserSkillsResponse = AddUserSkillResponse.fromJson(response.data);
          ApplicationToast.getSuccessToast(durationTime: 3, heading: "Added", subHeading: "Successfully added record");
          notifyListeners();
        }else{
          ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "No Data found");
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e..toString());
    }
  }
}