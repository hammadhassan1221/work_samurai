/// ResponseCode : 1
/// Data : [{"SupportTicketID":16,"SystemAdminID":null,"Body":"Mobile team testing","CreatedDate":"11/01/2021 10:56 PM","Document":null}]

class GetSupportMessages {
  int responseCode;
  List<Data> data;

  GetSupportMessages({
      this.responseCode, 
      this.data});

  GetSupportMessages.fromJson(dynamic json) {
    responseCode = json["ResponseCode"];
    if (json["Data"] != null) {
      data = [];
      json["Data"].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ResponseCode"] = responseCode;
    if (data != null) {
      map["Data"] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// SupportTicketID : 16
/// SystemAdminID : null
/// Body : "Mobile team testing"
/// CreatedDate : "11/01/2021 10:56 PM"
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