class ApiUrls {
  static const baseUrl = "https://food.elms.pk";
  static var header = {'content-type': 'application/json; charset=utf-8'};
  static const signUpUrl = "$baseUrl/api/FoodDelivery/PublicInsertClient";
  static const signInUrl = "$baseUrl/api/FoodDelivery/PublicCheckLogin";
  static const insertCategory =
      "$baseUrl/api/FoodDelivery/PublicInsertCategory";
  static const getCategory = "$baseUrl/api/FoodDelivery/PublicGetListCategory";
}
