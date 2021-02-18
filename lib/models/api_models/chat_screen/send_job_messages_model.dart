/// ResponseCode : 1
/// Data : {"ID":24,"JobID":1021,"UserID":4089,"Body":"for any info please send me a message","CreatedDate":"13/01/2021 08:02 PM","Document":null}

class SendJobMessagesModel {
  int responseCode;
  Data data;

  SendJobMessagesModel({
      this.responseCode, 
      this.data});

  SendJobMessagesModel.fromJson(dynamic json) {
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

/// ID : 24
/// JobID : 1021
/// UserID : 4089
/// Body : "for any info please send me a message"
/// CreatedDate : "13/01/2021 08:02 PM"
/// Document : null

class Data {
  int id;
  int jobID;
  int userID;
  String body;
  String createdDate;
  dynamic document;

  Data({
      this.id, 
      this.jobID, 
      this.userID, 
      this.body, 
      this.createdDate, 
      this.document});

  Data.fromJson(dynamic json) {
    id = json["ID"];
    jobID = json["JobID"];
    userID = json["UserID"];
    body = json["Body"];
    createdDate = json["CreatedDate"];
    document = json["Document"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ID"] = id;
    map["JobID"] = jobID;
    map["UserID"] = userID;
    map["Body"] = body;
    map["CreatedDate"] = createdDate;
    map["Document"] = document;
    return map;
  }

}