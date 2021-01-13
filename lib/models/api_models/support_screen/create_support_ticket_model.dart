/// ResponseCode : 1
/// Data : {"ID":30,"SystemUserID":4086,"AssignedAdminID":null,"TicketStatus":0,"Title":"Hello World","CreatedDate":"11/01/2021 07:51 PM"}

class CreateSupportTicketModel {
  int responseCode;
  Data data;

  CreateSupportTicketModel({
      this.responseCode, 
      this.data});

  CreateSupportTicketModel.fromJson(dynamic json) {
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

/// ID : 30
/// SystemUserID : 4086
/// AssignedAdminID : null
/// TicketStatus : 0
/// Title : "Hello World"
/// CreatedDate : "11/01/2021 07:51 PM"

class Data {
  int id;
  int systemUserID;
  dynamic assignedAdminID;
  int ticketStatus;
  String title;
  String createdDate;

  Data({
      this.id, 
      this.systemUserID, 
      this.assignedAdminID, 
      this.ticketStatus, 
      this.title, 
      this.createdDate});

  Data.fromJson(dynamic json) {
    id = json["ID"];
    systemUserID = json["SystemUserID"];
    assignedAdminID = json["AssignedAdminID"];
    ticketStatus = json["TicketStatus"];
    title = json["Title"];
    createdDate = json["CreatedDate"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["SystemUserID"] = systemUserID;
    map["AssignedAdminID"] = assignedAdminID;
    map["TicketStatus"] = ticketStatus;
    map["Title"] = title;
    map["CreatedDate"] = createdDate;
    return map;
  }

}