class UpdateAccountEntity {
  bool errors;
  Null data;
  String errorMessage;

  UpdateAccountEntity({this.errors, this.data, this.errorMessage});

  UpdateAccountEntity.fromJson(Map<String, dynamic> json) {
    errors = json['Errors'] != null ? json['Errors'] : null;
    data = json['Data'] != null ? json['Data'] : null;
    errorMessage = json['ErrorMessage'] != null ? json['ErrorMessage'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Errors'] = this.errors;
    data['Data'] = this.data;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}
