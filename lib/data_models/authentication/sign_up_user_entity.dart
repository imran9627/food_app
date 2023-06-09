class SignUpUserEntity {
  String? email;
  String? password;
  String? displayName;
  String? loginBy;

  SignUpUserEntity({this.email, this.password, this.displayName, this.loginBy});

  SignUpUserEntity.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    password = json['Password'];
    displayName = json['DisplayName'];
    loginBy = json['LoginBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['DisplayName'] = this.displayName;
    data['LoginBy'] = this.loginBy;
    return data;
  }
}
