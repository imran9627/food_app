import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_ap/data_models/authentication/sign_up_user_entity.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../data_source/api_urls.dart';

class RegistrationClient {
  static Future<bool> signUpProvider(
      SignUpUserEntity signUpUserEntity, BuildContext context) async {
    bool? status;
    Response response = await http.post(Uri.parse(ApiUrls.signUpUrl),
        body: json.encode(signUpUserEntity.toJson()), headers: ApiUrls.header);
    print('//////////////// ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      print(
          '${jsonData["Status"].toString().length}....................................');

      if (jsonData['Status'] == 'Client Inserted Successfully') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 700),
          content: Text('${jsonData["Status"]}'),
        ));
        status = true;
      } else {
        print('hjksdhfuilfhwelfhalkhfuweee............//////');
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
