/// ResponseCode : 1
/// Data : {"VerificationMethods":[{"ID":2,"Name":"Driving Licence","Description":"Check the documents that are needed as evidence of identity when you apply for a Victorian learner permit, licence or VicRoads customer number, and register or transfer a vehicle in Victoria.","Required":true,"Type":0,"IsActive":true,"CanExpire":true,"IsPoliceCheck":false},{"ID":3,"Name":"Vevo","Description":"Our Visa Entitlement Verification Online system (VEVO) allows visa holders, employers, education providers and other organisations to check visa conditions.\n\nAustralian citizens have unlimited rights to work or study in Australia. You cannot use VEVO to confirm this. You can provide a copy of your Australian citizenship certificate or your Australian passport to prove your citizenship.","Required":true,"Type":0,"IsActive":true,"CanExpire":true,"IsPoliceCheck":false},{"ID":6,"Name":"National Police Check","Description":"A National Police Check involves checking the police history of an applicant and may be required for a range of reasons such as employment screening.","Required":true,"Type":0,"IsActive":true,"CanExpire":true,"IsPoliceCheck":true}]}

class VerficationMethodsResponse {
  int _responseCode;
  Data _data;

  int get responseCode => _responseCode;
  Data get data => _data;

//   VerficationMethodsResponse({
//       int responseCode,
//       Data data}){
//     _responseCode = responseCode;
//     _data = data;
// }
  VerficationMethodsResponse.empty();

  VerficationMethodsResponse.fromJson(dynamic json) {
    _responseCode = json["ResponseCode"];
    _data = json["Data"] != null ? Data.fromJson(json["Data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = _responseCode;
    if (_data != null) {
      map["Data"] = _data.toJson();
    }
    return map;
  }

}

/// VerificationMethods : [{"ID":2,"Name":"Driving Licence","Description":"Check the documents that are needed as evidence of identity when you apply for a Victorian learner permit, licence or VicRoads customer number, and register or transfer a vehicle in Victoria.","Required":true,"Type":0,"IsActive":true,"CanExpire":true,"IsPoliceCheck":false},{"ID":3,"Name":"Vevo","Description":"Our Visa Entitlement Verification Online system (VEVO) allows visa holders, employers, education providers and other organisations to check visa conditions.\n\nAustralian citizens have unlimited rights to work or study in Australia. You cannot use VEVO to confirm this. You can provide a copy of your Australian citizenship certificate or your Australian passport to prove your citizenship.","Required":true,"Type":0,"IsActive":true,"CanExpire":true,"IsPoliceCheck":false},{"ID":6,"Name":"National Police Check","Description":"A National Police Check involves checking the police history of an applicant and may be required for a range of reasons such as employment screening.","Required":true,"Type":0,"IsActive":true,"CanExpire":true,"IsPoliceCheck":true}]

class Data {
  List<VerificationMethods> _verificationMethods;

  List<VerificationMethods> get verificationMethods => _verificationMethods;

  Data({
      List<VerificationMethods> verificationMethods}){
    _verificationMethods = verificationMethods;
}

  Data.fromJson(dynamic json) {
    if (json["VerificationMethods"] != null) {
      _verificationMethods = [];
      json["VerificationMethods"].forEach((v) {
        _verificationMethods.add(VerificationMethods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_verificationMethods != null) {
      map["VerificationMethods"] = _verificationMethods.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ID : 2
/// Name : "Driving Licence"
/// Description : "Check the documents that are needed as evidence of identity when you apply for a Victorian learner permit, licence or VicRoads customer number, and register or transfer a vehicle in Victoria."
/// Required : true
/// Type : 0
/// IsActive : true
/// CanExpire : true
/// IsPoliceCheck : false

class VerificationMethods {
  int _id;
  String _name;
  String _description;
  bool _required;
  int _type;
  bool _isActive;
  bool _canExpire;
  bool _isPoliceCheck;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  bool get required => _required;
  int get type => _type;
  bool get isActive => _isActive;
  bool get canExpire => _canExpire;
  bool get isPoliceCheck => _isPoliceCheck;

  VerificationMethods({
      int id, 
      String name, 
      String description, 
      bool required, 
      int type, 
      bool isActive, 
      bool canExpire, 
      bool isPoliceCheck}){
    _id = id;
    _name = name;
    _description = description;
    _required = required;
    _type = type;
    _isActive = isActive;
    _canExpire = canExpire;
    _isPoliceCheck = isPoliceCheck;
}

  VerificationMethods.fromJson(dynamic json) {
    _id = json["ID"];
    _name = json["Name"];
    _description = json["Description"];
    _required = json["Required"];
    _type = json["Type"];
    _isActive = json["IsActive"];
    _canExpire = json["CanExpire"];
    _isPoliceCheck = json["IsPoliceCheck"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = _id;
    map["Name"] = _name;
    map["Description"] = _description;
    map["Required"] = _required;
    map["Type"] = _type;
    map["IsActive"] = _isActive;
    map["CanExpire"] = _canExpire;
    map["IsPoliceCheck"] = _isPoliceCheck;
    return map;
  }

}