import 'dart:convert';

NewPasswordResponse newPasswordResponseFromJson(String str) => NewPasswordResponse.fromJson(json.decode(str));

String newPasswordResponseToJson(NewPasswordResponse data) => json.encode(data.toJson());

class NewPasswordResponse {
  NewPasswordResponse({
    this.responseCode,
    this.data,
  });

  int responseCode;
  dynamic data;

  factory NewPasswordResponse.fromJson(Map<String, dynamic> json) => NewPasswordResponse(
    responseCode: json["ResponseCode"] == null ? null : json["ResponseCode"],
    data: json["Data"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode == null ? null : responseCode,
    "Data": data,
  };
}