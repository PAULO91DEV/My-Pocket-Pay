class Data {
  Data({
    this.isValid,
    this.isActive,
    this.accntName,
    this.accntContactName,
    this.accntEmail,
    this.accntCellPhNum,
    this.accntMainPhNum,
    this.accntProfileId,
    this.accntId,
    this.accntBusNum,
    this.countryDocNumber,
    this.countryProfile,
    this.referredByAccountId,
    this.bankAccountNumber,
    this.bankAccountDigit,
    this.bankRoutingNumber,
    this.bankCode,
    this.bankName,
    this.currency,
    this.currencySymbol,
    this.docRequired,
    this.biRequired,
    this.authorization,
    this.availableBalance,
    this.address,
    this.addressComplement,
    this.addressNumber,
    this.city,
    this.state,
    this.country,
    this.neighborhood,
    this.postalCode,
    this.birthDate,
    this.generalRecord,
    this.accntType,
    this.language,
  });

  String isValid = "";
  String isActive = "";
  String accntName = "";
  String accntContactName = "";
  String accntEmail = "";
  String accntCellPhNum = "";
  String accntMainPhNum = "";
  String accntProfileId = "";
  String accntId = "";
  dynamic accntBusNum = "";
  String countryDocNumber = "";
  String countryProfile = "";
  dynamic referredByAccountId = "";
  String bankAccountNumber = "";
  String bankAccountDigit = "";
  String bankRoutingNumber = "";
  dynamic bankCode = "";
  dynamic bankName = "";
  String currency = "";
  String currencySymbol = "";
  String docRequired = "";
  String biRequired = "";
  String authorization = "";
  String availableBalance = "";
  String address = "";
  String addressComplement = "";
  String addressNumber = "";
  String city = "";
  String state = "";
  String country = "";
  String neighborhood = "";
  String postalCode = "";
  String birthDate = "";
  String generalRecord = "";
  String accntType = "";
  String language = "";

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isValid: json["IsValid"],
        isActive: json["IsActive"],
        accntName: json["AccntName"],
        accntContactName: json["AccntContactName"],
        accntEmail: json["AccntEmail"],
        accntCellPhNum: json["AccntCellPhNum"],
        accntMainPhNum: json["AccntMainPhNum"],
        accntProfileId: json["AccntProfileId"],
        accntId: json["AccntId"],
        accntBusNum: json["AccntBusNum"],
        countryDocNumber: json["CountryDocNumber"],
        countryProfile: json["CountryProfile"],
        referredByAccountId: json["REFERRED_BY_ACCOUNT_ID"],
        bankAccountNumber: json["BankAccountNumber"],
        bankAccountDigit: json["BankAccountDigit"],
        bankRoutingNumber: json["BankRoutingNumber"],
        bankCode: json["BankCode"],
        bankName: json["BankName"],
        currency: json["Currency"],
        currencySymbol: json["CurrencySymbol"],
        docRequired: json["DocRequired"],
        biRequired: json["BiRequired"],
        authorization: json["Authorization"],
        availableBalance: json["AvailableBalance"],
        address: json["Address"],
        addressComplement: json["AddressComplement"],
        addressNumber: json["AddressNumber"],
        city: json["City"],
        state: json["State"],
        country: json["Country"],
        neighborhood: json["Neighborhood"],
        postalCode: json["PostalCode"],
        birthDate: json["BirthDate"],
        generalRecord: json["GeneralRecord"],
        accntType: json["AccntType"],
        language: json["Language"],
      );

  Map<String, dynamic> toJson() => {
        "IsValid": isValid,
        "IsActive": isActive,
        "AccntName": accntName,
        "AccntContactName": accntContactName,
        "AccntEmail": accntEmail,
        "AccntCellPhNum": accntCellPhNum,
        "AccntMainPhNum": accntMainPhNum,
        "AccntProfileId": accntProfileId,
        "AccntId": accntId,
        "AccntBusNum": accntBusNum,
        "CountryDocNumber": countryDocNumber,
        "CountryProfile": countryProfile,
        "REFERRED_BY_ACCOUNT_ID": referredByAccountId,
        "BankAccountNumber": bankAccountNumber,
        "BankAccountDigit": bankAccountDigit,
        "BankRoutingNumber": bankRoutingNumber,
        "BankCode": bankCode,
        "BankName": bankName,
        "Currency": currency,
        "CurrencySymbol": currencySymbol,
        "DocRequired": docRequired,
        "BiRequired": biRequired,
        "Authorization": authorization,
        "AvailableBalance": availableBalance,
        "Address": address,
        "AddressComplement": addressComplement,
        "AddressNumber": addressNumber,
        "City": city,
        "State": state,
        "Country": country,
        "Neighborhood": neighborhood,
        "PostalCode": postalCode,
        "BirthDate": birthDate,
        "GeneralRecord": generalRecord,
        "AccntType": accntType,
        "Language": language,
      };

  Map<String, dynamic> toJson2() => {
        "IsValid": isValid,
        "IsActive": isActive,
        "AccntName": accntName,
        "AccntContactName": accntContactName,
        "AccntEmail": accntEmail,
        "AccntCellPhNum": accntCellPhNum,
        "AccntMainPhNum": accntMainPhNum,
        "AccntProfileId": accntProfileId,
        "AccntId": accntId,
        "AccntBusNum": accntBusNum,
        "CountryDocNumber": countryDocNumber,
        "CountryProfile": countryProfile,
        "REFERRED_BY_ACCOUNT_ID": referredByAccountId,
        "BankAccountNumber": bankAccountNumber,
        "BankAccountDigit": bankAccountDigit,
        "BankRoutingNumber": bankRoutingNumber,
        "BankCode": bankCode,
        "BankName": bankName,
        "Currency": currency,
        "CurrencySymbol": currencySymbol,
        "DocRequired": docRequired,
        "BiRequired": biRequired,
        "Authorization": authorization,
        "AvailableBalance": availableBalance,
        "Address": address,
        "AddressComplement": addressComplement,
        "AddressNumber": addressNumber,
        "City": city,
        "State": state,
        "Country": country,
        "Neighborhood": neighborhood,
        "PostalCode": postalCode,
        "BirthDate": birthDate,
        "GeneralRecord": generalRecord,
        "AccntType": accntType,
        "Language": language,
      };
}
