class SupportTicketsModel {
  int responseCode;
  Data data;

  SupportTicketsModel({this.responseCode, this.data});

  SupportTicketsModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<SupportTickets> supportTickets;

  Data({this.supportTickets});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['SupportTickets'] != null) {
      supportTickets = new List<SupportTickets>();
      json['SupportTickets'].forEach((v) {
        supportTickets.add(new SupportTickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supportTickets != null) {
      data['SupportTickets'] =
          this.supportTickets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupportTickets {
  int iD;
  int systemUserID;
  Null assignedAdminID;
  int ticketStatus;
  String title;
  String createdDate;

  SupportTickets(
      {this.iD,
        this.systemUserID,
        this.assignedAdminID,
        this.ticketStatus,
        this.title,
        this.createdDate});

  SupportTickets.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    systemUserID = json['SystemUserID'];
    assignedAdminID = json['AssignedAdminID'];
    ticketStatus = json['TicketStatus'];
    title = json['Title'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['SystemUserID'] = this.systemUserID;
    data['AssignedAdminID'] = this.assignedAdminID;
    data['TicketStatus'] = this.ticketStatus;
    data['Title'] = this.title;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}