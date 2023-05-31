import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ap/data_source/api_urls.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../data_models/authentication/sign_in_user_entity.dart';

class SignInClient {
  static Future<bool> signInProvider(
      SignInUserEntity signInUserEntity, BuildContext context) async {
    bool? status;
    Response response = await http.post(
        Uri.parse(
          ApiUrls.signInUrl,
        ),
        body: jsonEncode(
          signInUserEntity.toJason(),
        ),
        headers: ApiUrls.header);
    print('${response.statusCode}////////////////////////////');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      print(
          '${jsonData["Status"].toString().length}....................................');

      if (jsonData['Status'] == 'Login Successfully') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${jsonData["Status"]}')));
        status = true;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${jsonData["Status"]}')));
        status = false;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Some thing went wrong')));
      status = false;
    }
    print('$status........................');
    return status;
  }
}
