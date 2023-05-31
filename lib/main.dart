import 'package:flutter/material.dart';
import 'package:food_delivery_ap/screens/authentication_screens/sign_in_page.dart';
import 'package:food_delivery_ap/screens/user_interface_pages/category_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String?> userLoginInfo() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('userLoginInfo');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
          future: userLoginInfo(),
          builder: (context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.hasData) {
              return const FoodCategories();
            } else {
              return const SignInPage();
            }
          }),
    );
  }
}
