// To parse this JSON data, do
//
//     final getUserSettingResponse = getUserSettingResponseFromJson(jsonString);

import 'dart:convert';

GetUserSettingResponse getUserSettingResponseFromJson(String str) => GetUserSettingResponse.fromJson(json.decode(str));

String getUserSettingResponseToJson(GetUserSettingResponse data) => json.encode(data.toJson());

class GetUserSettingResponse {
  GetUserSettingResponse({
    this.responseCode,
    this.data,
  });

  int responseCode;
  List<Datum> data;

  factory GetUserSettingResponse.fromJson(Map<String, dynamic> json) => GetUserSettingResponse(
    responseCode: json["ResponseCode"] == null ? null : json["ResponseCode"],
    data: json["Data"] == null ? null : List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode == null ? null : responseCode,
    "Data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.systemUserId,
    this.parentSettingId,
    this.name,
    this.value,
    this.settingList,
  });

  int systemUserId;
  dynamic parentSettingId;
  String name;
  String value;
  List<SettingList> settingList;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    systemUserId: json["SystemUserID"] == null ? null : json["SystemUserID"],
    parentSettingId: json["ParentSettingID"],
    name: json["Name"] == null ? null : json["Name"],
    value: json["Value"] == null ? null : json["Value"],
    settingList: json["SettingList"] == null ? null : List<SettingList>.from(json["SettingList"].map((x) => SettingList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SystemUserID": systemUserId == null ? null : systemUserId,
    "ParentSettingID": parentSettingId,
    "Name": name == null ? null : name,
    "Value": value == null ? null : value,
    "SettingList": settingList == null ? null : List<dynamic>.from(settingList.map((x) => x.toJson())),
  };
}

class SettingList {
  SettingList({
    this.parentSettingId,
    this.name,
    this.value,
  });

  int parentSettingId;
  String name;
  String value;

  factory SettingList.fromJson(Map<String, dynamic> json) => SettingList(
    parentSettingId: json["ParentSettingID"] == null ? null : json["ParentSettingID"],
    name: json["Name"] == null ? null : json["Name"],
    value: json["Value"] == null ? null : json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "ParentSettingID": parentSettingId == null ? null : parentSettingId,
    "Name": name == null ? null : name,
    "Value": value == null ? null : value,
  };
}
