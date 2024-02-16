class CustomerDataModel {
  String? cId;
  String? cFirstName;
  String? cLastName;
  String? cAddress;
  String? cDistrict;
  String? cSubDistrict;
  String? cProvince;
  String? cPostCode;
  String? cTell;

  CustomerDataModel(
      {this.cId,
      this.cFirstName,
      this.cLastName,
      this.cAddress,
      this.cDistrict,
      this.cSubDistrict,
      this.cProvince,
      this.cPostCode,
      this.cTell});

  CustomerDataModel.fromJson(Map<String, dynamic> json) {
    cId = json['cId'];
    cFirstName = json['cFirstName'];
    cLastName = json['cLastName'];
    cAddress = json['cAddress'];
    cDistrict = json['cDistrict'];
    cSubDistrict = json['cSubDistrict'];
    cProvince = json['cProvince'];
    cPostCode = json['cPostCode'];
    cTell = json['cTell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cId'] = this.cId;
    data['cFirstName'] = this.cFirstName;
    data['cLastName'] = this.cLastName;
    data['cAddress'] = this.cAddress;
    data['cDistrict'] = this.cDistrict;
    data['cSubDistrict'] = this.cSubDistrict;
    data['cProvince'] = this.cProvince;
    data['cPostCode'] = this.cPostCode;
    data['cTell'] = this.cTell;
    return data;
  }
}