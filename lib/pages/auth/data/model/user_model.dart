class UserInfo {
  String? uin;
  String? firstName;
  String? midName;
  String? lastName;
  String? phone;

  UserInfo(Object object,
      {this.uin, this.firstName, this.midName, this.lastName, this.phone});

  UserInfo.fromJson(Map<String, dynamic> json) {
    uin = json['uin'];
    firstName = json['firstName'];
    midName = json['midName'];
    lastName = json['lastName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uin'] = this.uin;
    data['firstName'] = this.firstName;
    data['midName'] = this.midName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    return data;
  }
}
