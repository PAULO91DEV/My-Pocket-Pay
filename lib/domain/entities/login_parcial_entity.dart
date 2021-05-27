// To parse this JSON data, do
//
//     final loginParcialEntity = loginParcialEntityFromJson(jsonString);

import 'dart:convert';

LoginParcialEntity loginParcialEntityFromJson(String str) =>
    LoginParcialEntity.fromJson(json.decode(str));

String loginParcialEntityToJson(LoginParcialEntity data) =>
    json.encode(data.toJson());

class LoginParcialEntity {
  LoginParcialEntity({
    this.errors,
    this.accntNotFound,
    this.errorMessage,
  });

  bool errors;
  String accntNotFound;
  String errorMessage;

  factory LoginParcialEntity.fromJson(Map<String, dynamic> json) =>
      LoginParcialEntity(
        errors: json["Errors"],
        accntNotFound: json["AccntNotFound"],
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Errors": errors,
        "AccntNotFound": accntNotFound,
        "ErrorMessage": errorMessage,
      };
}
