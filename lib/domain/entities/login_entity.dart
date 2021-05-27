class LoginResponseEntity {
  bool errors;
  String accntNotFound;
  Data data;
  Auth auth;
  String errorMessage;

  LoginResponseEntity(
      {this.errors,
      this.accntNotFound,
      this.data,
      this.auth,
      this.errorMessage});

  LoginResponseEntity.fromJson(Map<String, dynamic> json) {
    errors = json['Errors'] != null ? json['Errors'] : null;
    accntNotFound =
        json['AccntNotFound'] != null ? json['AccntNotFound'] : null;
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    auth = json['Auth'] != null ? new Auth.fromJson(json['Auth']) : null;
    errorMessage = json['ErrorMessage'] != null ? json['ErrorMessage'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Errors'] = this.errors;
    data['AccntNotFound'] = this.accntNotFound;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    if (this.auth != null) {
      data['Auth'] = this.auth.toJson();
    }
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}

class Data {
  String isValid;
  String isActive;
  String accntName;
  String accntContactName;
  String accntEmail;
  String accntCellPhNum;
  String accntMainPhNum;
  String accntProfileId;
  String accntId;
  Null accntBusNum;
  String countryDocNumber;
  String countryProfile;
  Null rEFERREDBYACCOUNTID;
  String bankAccountNumber;
  String bankAccountDigit;
  String bankRoutingNumber;
  String bankCode;
  String bankName;
  String currency;
  String currencySymbol;
  String docRequired;
  String biRequired;
  Null authorization;
  String availableBalance;
  String address;
  String addressComplement;
  String addressNumber;
  String city;
  String state;
  String country;
  String neighborhood;
  String postalCode;
  String birthDate;
  String generalRecord;
  String accntType;
  String termAccepted;
  String language;

  Data(
      {this.isValid,
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
      this.rEFERREDBYACCOUNTID,
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
      this.termAccepted,
      this.language});

  Data.fromJson(Map<String, dynamic> json) {
    isValid = json['IsValid'];
    isActive = json['IsActive'];
    accntName = json['AccntName'];
    accntContactName = json['AccntContactName'];
    accntEmail = json['AccntEmail'];
    accntCellPhNum = json['AccntCellPhNum'];
    accntMainPhNum = json['AccntMainPhNum'];
    accntProfileId = json['AccntProfileId'];
    accntId = json['AccntId'];
    accntBusNum = json['AccntBusNum'] != null ? json['AccntBusNum'] : null;
    countryDocNumber = json['CountryDocNumber'];
    countryProfile = json['CountryProfile'];
    rEFERREDBYACCOUNTID = json['REFERRED_BY_ACCOUNT_ID'] != null
        ? json['REFERRED_BY_ACCOUNT_ID']
        : null;
    bankAccountNumber = json['BankAccountNumber'];
    bankAccountDigit = json['BankAccountDigit'];
    bankRoutingNumber = json['BankRoutingNumber'];
    bankCode = json['BankCode'] != null ? json['BankCode'] : null;
    bankName = json['BankName'] != null ? json['BankName'] : null;
    currency = json['Currency'];
    currencySymbol = json['CurrencySymbol'];
    docRequired = json['DocRequired'];
    biRequired = json['BiRequired'];
    authorization =
        json['Authorization'] != null ? json['Authorization'] : null;
    availableBalance = json['AvailableBalance'];
    address = json['Address'];
    addressComplement = json['AddressComplement'];
    addressNumber = json['AddressNumber'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    neighborhood = json['Neighborhood'];
    postalCode = json['PostalCode'];
    birthDate = json['BirthDate'];
    generalRecord = json['GeneralRecord'];
    accntType = json['AccntType'];
    termAccepted = json['TermAccepted'];
    language = json['Language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsValid'] = this.isValid;
    data['IsActive'] = this.isActive;
    data['AccntName'] = this.accntName;
    data['AccntContactName'] = this.accntContactName;
    data['AccntEmail'] = this.accntEmail;
    data['AccntCellPhNum'] = this.accntCellPhNum;
    data['AccntMainPhNum'] = this.accntMainPhNum;
    data['AccntProfileId'] = this.accntProfileId;
    data['AccntId'] = this.accntId;
    data['AccntBusNum'] = this.accntBusNum;
    data['CountryDocNumber'] = this.countryDocNumber;
    data['CountryProfile'] = this.countryProfile;
    data['REFERRED_BY_ACCOUNT_ID'] = this.rEFERREDBYACCOUNTID;
    data['BankAccountNumber'] = this.bankAccountNumber;
    data['BankAccountDigit'] = this.bankAccountDigit;
    data['BankRoutingNumber'] = this.bankRoutingNumber;
    data['BankCode'] = this.bankCode;
    data['BankName'] = this.bankName;
    data['Currency'] = this.currency;
    data['CurrencySymbol'] = this.currencySymbol;
    data['DocRequired'] = this.docRequired;
    data['BiRequired'] = this.biRequired;
    data['Authorization'] = this.authorization;
    data['AvailableBalance'] = this.availableBalance;
    data['Address'] = this.address;
    data['AddressComplement'] = this.addressComplement;
    data['AddressNumber'] = this.addressNumber;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Neighborhood'] = this.neighborhood;
    data['PostalCode'] = this.postalCode;
    data['BirthDate'] = this.birthDate;
    data['GeneralRecord'] = this.generalRecord;
    data['AccntType'] = this.accntType;
    data['TermAccepted'] = this.termAccepted;
    data['Language'] = this.language;
    return data;
  }
}

class Auth {
  String error;
  String errorDescription;
  String hint;
  String message;

  Auth({this.error, this.errorDescription, this.hint, this.message});

  Auth.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
    hint = json['hint'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['error_description'] = this.errorDescription;
    data['hint'] = this.hint;
    data['message'] = this.message;
    return data;
  }
}
