// To parse this JSON data, do
//
//     final genericResponse = genericResponseFromJson(jsonString);

import 'dart:convert';

GenericResponse genericResponseFromJson(String str) =>
    GenericResponse.fromJson(json.decode(str));

String genericResponseToJson(GenericResponse data) =>
    json.encode(data.toJson());

class GenericResponse {
  GenericResponse({
    this.responseCode,
    this.data,
  });

  int responseCode;
  dynamic data;

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      GenericResponse(
        responseCode:
            json["ResponseCode"] == null ? null : json["ResponseCode"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "ResponseCode": responseCode == null ? null : responseCode,
        "Data": data,
      };
}
