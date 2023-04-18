class Registration {
  String? uin;
  String? password;
  String? firstName;
  String? midName;
  String? lastName;
  String? phone;

  Registration(
      {this.uin,
      this.password,
      this.firstName,
      this.midName,
      this.lastName,
      this.phone});

  Registration.fromJson(Map<String, dynamic> json) {
    uin = json['uin'];
    password = json['password'];
    firstName = json['firstName'];
    midName = json['midName'];
    lastName = json['lastName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uin'] = uin;
    data['password'] = password;
    data['firstName'] = firstName;
    data['midName'] = midName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    return data;
  }
}
