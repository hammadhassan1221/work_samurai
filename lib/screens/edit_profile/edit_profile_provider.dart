import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/generic_response/GenericResponse.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile.dart';
import 'package:work_samurai/widgets/loader.dart';

class EditProfileProviders extends ChangeNotifier {
  BuildContext context;

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
    } catch (e) {
      print(e.toString());
    }
  }

  Future getVerifiedEmail({@required BuildContext context}) async {
    try {
      dio.options.contentType = Headers.formUrlEncodedContentType;

      Response _response = await dio.post(
        getVerifyEmail,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization":
                "Bearer 1hn6zOS9VbDnmugvz6vXG14yhwQ0B4KGH7nPviGA3Rg6olY9wdS7n0+sLbVhCZ+ZFMVHkn+gidAhavFFvLiipsf2HYneGY3eR9LxtvloP8a8eg3Tkis89LoV6NFFXCtf003oYn5jz40GHR9NyuXZU6lNpH6ip7G6jzhnoEOtta1IQVOb578jpAZv92ovTGc1J5WcIoWKXApZqBcxyJPCZ6MadeVavYB6ntUffe594g7r7k4bntiWQ55zcam7aAEavkNehTQtTkujsmQFhlePAIxJ0Gk8DFilqr1mwI97c//w0=",
            "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
          },
        ),
      );

//      _loader.showLoader(context: context);
//      Response _response = await _networkHelper.post(getVerifyEmail, headers: {
//        //"Authorization": "Bearer " + _token,
//        "Authorization": "Bearer 1hn6zOS9VbDnmugvz6vXG14yhwQ0B4KGH7nPviGA3Rg6olY9wdS7n0+sLbVhCZ+ZFMVHkn+gidAhavFFvLiipsf2HYneGY3eR9LxtvloP8a8eg3Tkis89LoV6NFFXCtf003oYn5jz40GHR9NyuXZU6lNpH6ip7G6jzhnoEOtta1IQVOb578jpAZv92ovTGc1J5WcIoWKXApZqBcxyJPCZ6MadeVavYB6ntUffe594g7r7k4bntiWQ55zcam7aAEavkNehTQtTkujsmQFhlePAIxJ0Gk8DFilqr1mwI97c//w0=",
//        "DeviceID": "A580E6FE-DA99-4066-AFC7-C939104AED7F",
//      },body:{
//        "Token": "",
//      } );

      if (_response.statusCode != 200) {
        _loader.hideLoader(context);
        throw ("couldn't get the data");
      }
      if (_response.statusCode == 200) {
        _loader.hideLoader(context);

        GenericResponse _genericResponse = GenericResponse.fromJson(
            _genericDecodeEncode.decodeJson(Helper.getString(_response.data)));

        if (_genericResponse.responseCode == 1) {
          ProfileSettings _profileSettings = ProfileSettings();
//          _profileSettings._emailSheet(context);
        }
      }
    } catch (e) {
      _loader.hideLoader(context);
      print(e.toString());
    }
  }
}
