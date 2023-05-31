import 'package:flutter/material.dart';
import 'package:food_delivery_ap/controllers/api_client/authentication_client/registration_client.dart';
import 'package:food_delivery_ap/data_models/authentication/sign_up_user_entity.dart';
import 'package:food_delivery_ap/screens/user_interface_pages/category_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/custom_textField.dart';
import '../utils/constants/strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _userName;
  late TextEditingController _password;
  late TextEditingController _displayName;
  late TextEditingController _id;

  late final SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
    _userName = TextEditingController();
    _password = TextEditingController();
    _displayName = TextEditingController();
    _id = TextEditingController();
  }

  Future<void> initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userName.dispose();
    _password.dispose();
    _password.dispose();
    _displayName.dispose();
    _id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(TextStrings.appBarSignUp),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32),
                child: CustomWidget.CustomTextField(
                    controller: _userName,
                    titleName: TextStrings.userNameTitle),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: CustomWidget.CustomTextField(
                    controller: _password,
                    titleName: TextStrings.userNamePassword),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: CustomWidget.CustomTextField(
                    controller: _displayName,
                    titleName: TextStrings.userDisplay),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: CustomWidget.CustomTextField(
                    controller: _id, titleName: TextStrings.userId),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var signUpData = SignUpUserEntity(
                      email: _userName.text,
                      password: _password.text,
                      displayName: _displayName.text,
                      loginBy: _id.text,
                    );
                    bool status = await RegistrationClient.signUpProvider(
                        signUpData, context);
                    if (status) {
                      prefs.setString("userLoginInfo", _userName.text);
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodCategories())),
                      );

                      _userName.clear();
                      _password.clear();
                      _displayName.clear();
                      _id.clear();
                    }
                  },
                  child: const Text('SignUp')),
            ],
          ),
        ),
      ),
    );
  }
}
