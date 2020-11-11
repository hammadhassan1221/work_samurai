import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/helper/helper.dart';
import 'package:work_samurai/models/api_models/login_screen/login_response.dart';
import 'package:work_samurai/models/hitting_model/sign_up_screen/sign_up_model.dart';
import 'package:work_samurai/network/api_urls.dart';
import 'package:work_samurai/network/network_helper.dart';
import 'package:work_samurai/network/network_helper_impl.dart';
import 'package:work_samurai/screens/worker/worker.dart';
import 'package:work_samurai/widgets/loader.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/utilities/utilities.dart';

class SignUpProvider extends ChangeNotifier {
  BuildContext _context;

  NetworkHelper _networkHelper = NetworkHelperImpl();
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  Loader _loader = Loader();
  LoginResponse _loginResponse = LoginResponse();


  init({@required BuildContext context}) {
    this._context = context;
  }

  callSignUpAPI({@required SignUpModel signUpModel,@required BuildContext context, @required String confirmPassword, @required String male, @required String female, @required onCheck}){
    if(signUpModel.firstName.isNotEmpty){
      if(signUpModel.lastName.isNotEmpty){
        if(signUpModel.emailAddress.isNotEmpty && signUpModel.emailAddress.toString().validateEmail()){
          if(signUpModel.password.isNotEmpty){
            if(confirmPassword.isNotEmpty){
              if(signUpModel.password == confirmPassword){
                if(male.isNotEmpty || female.isNotEmpty){
                  if(signUpModel.phone.isNotEmpty && signUpModel.phone.validatePhoneNumber()){
                    if(onCheck){
                      userSignUp(context: context, signUpModel: signUpModel);
                    }else{
                      ApplicationToast.getWarningToast(durationTime: 3, heading: "Please accept the term and conditions", subHeading: "");
                    }
                  }else{
                    ApplicationToast.getWarningToast(durationTime: 3, heading: "Phone number is missing and it should be in correct format", subHeading: "Format: +61 (02) 89876544");
                  }
                }else{
                  ApplicationToast.getWarningToast(durationTime: 3, heading: "Gender is missing", subHeading: "");
                }
              }else{
                ApplicationToast.getWarningToast(durationTime: 3, heading: "Password not matched", subHeading: "");
              }
            }else{
              ApplicationToast.getWarningToast(durationTime: 3, heading: "Confirm Password is missing", subHeading: "");
            }
          }else{
            ApplicationToast.getWarningToast(durationTime: 3, heading: "Password is missing", subHeading: "");
          }
        }else{
          ApplicationToast.getWarningToast(durationTime: 3, heading: "Email Shouldn't be empty and it should be in correct format", subHeading: "Format: example@example.com ");
        }
      }else{
        ApplicationToast.getWarningToast(durationTime: 3, heading: "Last Name is missing", subHeading: "");
      }
    }else{
      ApplicationToast.getWarningToast(durationTime: 3, heading: "First Name is missing", subHeading: "");
    }
  }

  Future userSignUp(
      {@required BuildContext context,
      @required SignUpModel signUpModel}) async {
    try{
      _loader.showLoader(context: context);
      Response _response = await _networkHelper.post(
          signUpURL,
          headers: {
            "Authorization" : "Bearer KH87NJi0KdODA9KpXZQkrXbDWEFokc1PxYRbv+vV+ogYmCp4PJNALryPllpjNNzY/0r2fTA8a91DGXoa9cRpDkI1EI4v5lPfpqpImF2kssumZ9Y/n3wkCZF8Qqd2HAdCE=",
            "Content-Type" : "multipart/form-data",
            "DeviceID" : "A580E6FE-DA99-4066-AFC7-C939104AED7F"
          },
          body: {
            "EmailAddress" : signUpModel.emailAddress,
            "Password" : signUpModel.password,
            "Firstname" : signUpModel.firstName,
            "Lastname" : signUpModel.lastName,
            "Salutation" : signUpModel.salutation,
            "ProfessionalTitle" : signUpModel.professionalTitle,
            "DOB" : signUpModel.dob,
            "PlaceOfBirth" : signUpModel.placeOfBirth,
            "Gender" : signUpModel.gender,
            "Description" : signUpModel.description,
            "TNCAccepted" : signUpModel.tncAccepted,
            "Phone" : signUpModel.phone,
            "Mobile" : signUpModel.mobile,
            "Facebook" : signUpModel.facebook,
            "Twitter" : signUpModel.twitter,
            "Instagram" : signUpModel.instagram,

          }
      );

      if(_response.statusCode != 200){
        _loader.hideLoader(context);
        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "");
        throw("Couldn't signUp");
      }
      if(_response.statusCode == 200){
        _loader.hideLoader(context);
        ApplicationToast.getSuccessToast(durationTime: 3, heading: "Congratulation", subHeading: "");
        _loginResponse = LoginResponse.fromJson(_genericDecodeEncode.decodeJson(Helper.getString(_response)));

        ApplicationToast.getSuccessToast(durationTime: 3,
            heading: "Success",
            subHeading: "Welcome to Work Samurai");

        print(_loginResponse.accessExpiry);
        Navigator.pushReplacement(context, SlideRightRoute(page: Worker()));
      }
    }
    catch(e){
      _loader.hideLoader(context);
      print(e.toString());
    }

  }
}
