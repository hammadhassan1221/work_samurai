/// ResponseCode : 1
/// Data : {"ID":9,"SystemUserID":4096,"VerificationMethodID":2,"Name":null,"Description":null,"Verified":false,"VerifiedDate":null,"ExpiryDate":null,"Document":null,"Verification":null}

class AddDocumentVerificationResponse {
  int _responseCode;
  Data _data;

  int get responseCode => _responseCode;
  Data get data => _data;

//   AddDocumentVerificationResponse({
//       int responseCode,
//       Data data}){
//     _responseCode = responseCode;
//     _data = data;
// }
  AddDocumentVerificationResponse.empty();

  AddDocumentVerificationResponse.fromJson(dynamic json) {
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

/// ID : 9
/// SystemUserID : 4096
/// VerificationMethodID : 2
/// Name : null
/// Description : null
/// Verified : false
/// VerifiedDate : null
/// ExpiryDate : null
/// Document : null
/// Verification : null

class Data {
  int _id;
  int _systemUserID;
  int _verificationMethodID;
  dynamic _name;
  dynamic _description;
  bool _verified;
  dynamic _verifiedDate;
  dynamic _expiryDate;
  dynamic _document;
  dynamic _verification;

  int get id => _id;
  int get systemUserID => _systemUserID;
  int get verificationMethodID => _verificationMethodID;
  dynamic get name => _name;
  dynamic get description => _description;
  bool get verified => _verified;
  dynamic get verifiedDate => _verifiedDate;
  dynamic get expiryDate => _expiryDate;
  dynamic get document => _document;
  dynamic get verification => _verification;

  Data({
      int id, 
      int systemUserID, 
      int verificationMethodID, 
      dynamic name, 
      dynamic description, 
      bool verified, 
      dynamic verifiedDate, 
      dynamic expiryDate, 
      dynamic document, 
      dynamic verification}){
    _id = id;
    _systemUserID = systemUserID;
    _verificationMethodID = verificationMethodID;
    _name = name;
    _description = description;
    _verified = verified;
    _verifiedDate = verifiedDate;
    _expiryDate = expiryDate;
    _document = document;
    _verification = verification;
}

  Data.fromJson(dynamic json) {
    _id = json["ID"];
    _systemUserID = json["SystemUserID"];
    _verificationMethodID = json["VerificationMethodID"];
    _name = json["Name"];
    _description = json["Description"];
    _verified = json["Verified"];
    _verifiedDate = json["VerifiedDate"];
    _expiryDate = json["ExpiryDate"];
    _document = json["Document"];
    _verification = json["Verification"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = _id;
    map["SystemUserID"] = _systemUserID;
    map["VerificationMethodID"] = _verificationMethodID;
    map["Name"] = _name;
    map["Description"] = _description;
    map["Verified"] = _verified;
    map["VerifiedDate"] = _verifiedDate;
    map["ExpiryDate"] = _expiryDate;
    map["Document"] = _document;
    map["Verification"] = _verification;
    return map;
  }

}