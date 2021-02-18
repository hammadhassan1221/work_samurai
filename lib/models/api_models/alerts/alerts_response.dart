import 'package:work_samurai/screens/worker/pages/alerts/alerts.dart';

/// ResponseCode : 1
/// Data : [{"ID":44,"Type":6,"EntityID":null,"Title":"Verify Mobile","Body":"Please verify your mobile number.","CreatedDate":"09/01/2021 09:28 PM"},{"ID":43,"Type":5,"EntityID":null,"Title":"Verify Email","Body":"An email has been sent to your email address for verification.","CreatedDate":"09/01/2021 09:28 PM"},{"ID":42,"Type":7,"EntityID":null,"Title":"Update Account","Body":"Update your account preferences and add your address.","CreatedDate":"09/01/2021 09:28 PM"}]

class AlertsResponse {
  int _responseCode;
  List<Data> _data;

  int get responseCode => _responseCode;
  List<Data> get data => _data;

//   AlertsResponse({
//       int responseCode,
//       List<Data> data}){
//     _responseCode = responseCode;
//     _data = data;
// }
  AlertsResponse.empty();

  AlertsResponse.fromJson(dynamic json) {
    _responseCode = json["ResponseCode"];
    if (json["Data"] != null) {
      _data = [];
      json["Data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = _responseCode;
    if (_data != null) {
      map["Data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 44
/// Type : 6
/// EntityID : null
/// Title : "Verify Mobile"
/// Body : "Please verify your mobile number."
/// CreatedDate : "09/01/2021 09:28 PM"

class Data {
  int _id;
  int _type;
  dynamic _entityID;
  String _title;
  String _body;
  String _createdDate;

  int get id => _id;
  int get type => _type;
  dynamic get entityID => _entityID;
  String get title => _title;
  String get body => _body;
  String get createdDate => _createdDate;

  Data({
      int id, 
      int type, 
      dynamic entityID, 
      String title, 
      String body, 
      String createdDate}){
    _id = id;
    _type = type;
    _entityID = entityID;
    _title = title;
    _body = body;
    _createdDate = createdDate;
}

  Data.fromJson(dynamic json) {
    _id = json["ID"];
    _type = json["Type"];
    _entityID = json["EntityID"];
    _title = json["Title"];
    _body = json["Body"];
    _createdDate = json["CreatedDate"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = _id;
    map["Type"] = _type;
    map["EntityID"] = _entityID;
    map["Title"] = _title;
    map["Body"] = _body;
    map["CreatedDate"] = _createdDate;
    return map;
  }

}