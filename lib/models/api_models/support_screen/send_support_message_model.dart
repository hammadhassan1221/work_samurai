/// ResponseCode : 1
/// Data : {"SupportTicketID":16,"SystemAdminID":null,"Body":"testing with new message hello how r u kia hal ha testing script \"Lod Modales El Hombre momento\"","CreatedDate":"12/01/2021 07:53 PM","Document":null}

class SendSupportMessageModel {
  int responseCode;
  Data data;

  SendSupportMessageModel({
      this.responseCode, 
      this.data});

  SendSupportMessageModel.fromJson(dynamic json) {
    responseCode = json["ResponseCode"];
    data = json["Data"] != null ? Data.fromJson(json["Data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = responseCode;
    if (data != null) {
      map["Data"] = data.toJson();
    }
    return map;
  }

}

/// SupportTicketID : 16
/// SystemAdminID : null
/// Body : "testing with new message hello how r u kia hal ha testing script \"Lod Modales El Hombre momento\""
/// CreatedDate : "12/01/2021 07:53 PM"
/// Document : null

class Data {
  int supportTicketID;
  dynamic systemAdminID;
  String body;
  String createdDate;
  dynamic document;

  Data({
      this.supportTicketID, 
      this.systemAdminID, 
      this.body, 
      this.createdDate, 
      this.document});

  Data.fromJson(dynamic json) {
    supportTicketID = json["SupportTicketID"];
    systemAdminID = json["SystemAdminID"];
    body = json["Body"];
    createdDate = json["CreatedDate"];
    document = json["Document"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["SupportTicketID"] = supportTicketID;
    map["SystemAdminID"] = systemAdminID;
    map["Body"] = body;
    map["CreatedDate"] = createdDate;
    map["Document"] = document;
    return map;
  }

}