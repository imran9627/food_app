class SignInUserEntity {
  String? userName;
  String? password;

  SignInUserEntity({required this.userName, required this.password});

  static const userNameKey = 'Email';
  static const passwordKey = 'Password';

  Map<String, dynamic> toJason() {
    return {userNameKey: userName, passwordKey: password};
  }
}
