/// ResponseCode : 1
/// Data : null

class PoliceVerificationModel {
  int responseCode;
  dynamic data;

  PoliceVerificationModel({
      this.responseCode, 
      this.data});

  PoliceVerificationModel.fromJson(dynamic json) {
    responseCode = json["ResponseCode"];
    data = json["Data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = responseCode;
    map["Data"] = data;
    return map;
  }

}