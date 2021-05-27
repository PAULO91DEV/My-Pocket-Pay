// To parse this JSON data, do
//
//     final updateAccountRequestEntity = updateAccountRequestEntityFromJson(jsonString);

import 'dart:convert';

UpdateAccountRequestEntity updateAccountRequestEntityFromJson(String str) =>
    UpdateAccountRequestEntity.fromJson(json.decode(str));

String updateAccountRequestEntityToJson(UpdateAccountRequestEntity data) =>
    json.encode(data.toJson());

class UpdateAccountRequestEntity {
  UpdateAccountRequestEntity({
    this.accntId,
    this.address,
    this.addressComplement,
    this.addressNumber,
    this.neighborhood,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });

  String accntId;
  String address;
  String addressComplement;
  String addressNumber;
  String neighborhood;
  String city;
  String state;
  String postalCode;
  String country;

  factory UpdateAccountRequestEntity.fromJson(Map<String, dynamic> json) =>
      UpdateAccountRequestEntity(
        accntId: json["AccntId"],
        address: json["Address"],
        addressComplement: json["AddressComplement"],
        addressNumber: json["AddressNumber"],
        neighborhood: json["Neighborhood"],
        city: json["City"],
        state: json["State"],
        postalCode: json["PostalCode"],
        country: json["Country"],
      );

  Map<String, dynamic> toJson() => {
        "AccntId": accntId,
        "Address": address,
        "AddressComplement": addressComplement,
        "AddressNumber": addressNumber,
        "Neighborhood": neighborhood,
        "City": city,
        "State": state,
        "PostalCode": postalCode,
        "Country": country,
      };
}
