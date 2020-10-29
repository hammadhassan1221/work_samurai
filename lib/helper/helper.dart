


import 'package:http/http.dart';

class Helper{

  static getString(Response response){
    return response.body.toString();
  }
}