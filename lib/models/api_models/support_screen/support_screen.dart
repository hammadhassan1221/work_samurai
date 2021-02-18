// To parse this JSON data, do
//
//     final supportTicketResponse = supportTicketResponseFromJson(jsonString);

import 'dart:convert';

SupportTicketResponse supportTicketResponseFromJson(String str) => SupportTicketResponse.fromJson(json.decode(str));

String supportTicketResponseToJson(SupportTicketResponse data) => json.encode(data.toJson());

class SupportTicketResponse {
  SupportTicketResponse({
    this.responseCode,
    this.data,
  });

  int responseCode;
  Data data;

  factory SupportTicketResponse.fromJson(Map<String, dynamic> json) => SupportTicketResponse(
    responseCode: json["ResponseCode"] == null ? null : json["ResponseCode"],
    data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode == null ? null : responseCode,
    "Data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.systemUserId,
    this.assignedAdminId,
    this.ticketStatus,
    this.title,
    this.createdDate,
  });

  int id;
  int systemUserId;
  dynamic assignedAdminId;
  int ticketStatus;
  String title;
  String createdDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"] == null ? null : json["ID"],
    systemUserId: json["SystemUserID"] == null ? null : json["SystemUserID"],
    assignedAdminId: json["AssignedAdminID"],
    ticketStatus: json["TicketStatus"] == null ? null : json["TicketStatus"],
    title: json["Title"] == null ? null : json["Title"],
    createdDate: json["CreatedDate"] == null ? null : json["CreatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "SystemUserID": systemUserId == null ? null : systemUserId,
    "AssignedAdminID": assignedAdminId,
    "TicketStatus": ticketStatus == null ? null : ticketStatus,
    "Title": title == null ? null : title,
    "CreatedDate": createdDate == null ? null : createdDate,
  };
}
