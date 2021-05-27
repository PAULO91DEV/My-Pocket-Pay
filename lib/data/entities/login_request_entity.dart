// To parse this JSON data, do
//
//     final loginRequestEntity = loginRequestEntityFromJson(jsonString);

import 'dart:convert';

LoginRequestEntity loginRequestEntityFromJson(String str) =>
    LoginRequestEntity.fromJson(json.decode(str));

String loginRequestEntityToJson(LoginRequestEntity data) =>
    json.encode(data.toJson());

class LoginRequestEntity {
  LoginRequestEntity({
    this.docNumber,
    this.accntType,
    this.activatationKey,
  });

  String docNumber;
  String accntType;
  String activatationKey;

  factory LoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      LoginRequestEntity(
        docNumber: json["DocNumber"],
        accntType: json["AccntType"],
        activatationKey: json["ActivatationKey"],
      );

  Map<String, dynamic> toJson() => {
        "DocNumber": docNumber,
        "AccntType": accntType,
        "ActivatationKey": activatationKey,
      };
}
