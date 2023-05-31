import 'package:flutter/material.dart';
import 'package:food_delivery_ap/data_source/api_urls.dart';
import 'package:food_delivery_ap/screens/authentication_screens/sign_up_page.dart';
import 'package:food_delivery_ap/screens/custom_widgets/custom_textField.dart';
import 'package:food_delivery_ap/screens/user_interface_pages/category_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/api_client/authentication_client/signIn_client.dart';
import '../../data_models/authentication/sign_in_user_entity.dart';
import '../utils/constants/strings.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _userName;
  late TextEditingController _password;
  late final SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSharedPref();
    _userName = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userName.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(TextStrings.appBarLogin),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: CustomWidget.CustomTextField(
                controller: _userName, titleName: TextStrings.userNameTitle),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: CustomWidget.CustomTextField(
                controller: _password, titleName: TextStrings.userNamePassword),
          ),
          ElevatedButton(
              onPressed: () async {
                print(ApiUrls.signInUrl);
                var signInData = SignInUserEntity(
                    userName: _userName.text, password: _password.text);
                var status = await SignInClient.signInProvider(
                  signInData,
                  context,
                );
                if (status) {
                  prefs.setString("userLoginInfo", _userName.text);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodCategories(),
                      ));
                }
              },
              child: const Text('Login')),
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ));
                  },
                  child: const Text("SignUp"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
