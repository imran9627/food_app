import 'package:flutter/material.dart';
import 'package:food_delivery_ap/controllers/api_client/food_items_apis/food_item_providers.dart';
import 'package:food_delivery_ap/data_models/food_items_models/category_item_entity.dart';
import 'package:food_delivery_ap/screens/utils/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication_screens/sign_in_page.dart';
import '../custom_widgets/custom_textField.dart';

class FoodCategories extends StatefulWidget {
  const FoodCategories({Key? key}) : super(key: key);

  @override
  State<FoodCategories> createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  late TextEditingController categoryController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    categoryController = TextEditingController();
  }

  @override
  void dispose() {
    categoryController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              var pref = await SharedPreferences.getInstance();

              print('logout pressed');
              print('${pref.getString('userLoginInfo')}/////////before');
              await pref.remove('userLoginInfo');
              print('${pref.getString('userLoginInfo')}............after');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ));
            },
            icon: const Icon(Icons.logout)),
        actions: [
          IconButton(
              onPressed: () => addCategory(context),
              icon: const Icon(Icons.add)),
        ],
        centerTitle: true,
        title: const Text('Categories'),
      ),
      body: FutureBuilder<List<dynamic>?>(
          future: FoodItemProviders.getCategory(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                              flex: 3,
                              child: Icon(
                                Icons.camera_alt,
                                size: 80,
                                color: Colors.black26,
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                snapshot.data?[index]
                                    [CategoryItem.categoryTitleKey],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No data found'));
              }
            } else {
              return const Center(child: Text('some thing went wrong'));
            }
          }),
    );
  }

  void addCategory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyInputField(
                  controller: categoryController,
                  label: TextStrings.category,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var data = CategoryItem(title: categoryController.text);
                      await FoodItemProviders.setCategory(data, context);
                      print('category inserted successfully');

                      Navigator.pop(context);
                      categoryController.clear();
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
