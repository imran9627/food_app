import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_ap/data_models/food_items_models/category_item_entity.dart';
import 'package:food_delivery_ap/data_source/api_urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FoodItemProviders {
  static Future<void> setCategory(
      CategoryItem categoryItem, BuildContext context) async {
    Response response = await http.post(Uri.parse(ApiUrls.insertCategory),
        body: json.encode(categoryItem.toJson()), headers: ApiUrls.header);

    print('${response.statusCode}...................');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      print('${jsonData['Status']}');

      if (jsonData['Status'] == 'Inserted Successfully') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 700),
          content: Text('${jsonData["Status"]}'),
        ));
        // status = true;
      } else {
        print('hjksdhfuilfhwelfhalkhfuweee............//////');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${jsonData["Status"]}')));
        // status = false;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Some thing went wrong')));
      // status = false;
    }
    // print('$status........................');
  }

  static Future<List<dynamic>?> getCategory() async {
    List<dynamic>? data = [];
    Response response = await http.get(
      Uri.parse(ApiUrls.getCategory),
    );

    print('${response.statusCode}...................');

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      //print('${jsonData['data']}');
      data = jsonData;
    }
    return data;
  }
}
