





// To parse this JSON data, do
//
//     final baseReponse = baseReponseFromJson(jsonString);

import 'dart:convert';

BaseReponse baseReponseFromJson(String str) => BaseReponse.fromJson(json.decode(str));

String baseReponseToJson(BaseReponse data) => json.encode(data.toJson());

class BaseReponse {
  String status;
  int code;
  String data;

  BaseReponse({
    required this.status,
    required this.code,
    required this.data,
  });

  factory BaseReponse.fromJson(Map<String, dynamic> json) => BaseReponse(
    status: json["status"],
    code: json["code"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data,
  };
}
