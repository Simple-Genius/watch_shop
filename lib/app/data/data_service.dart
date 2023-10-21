import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:watch_shop/app/data/models/category_item_model.dart';
import 'package:watch_shop/app/data/models/product_model.dart';

class DataService extends GetxService {
  @override
  void onInit() {
    super.onInit();
    getProducts();
    getCategories();
  }

  Future<List<Product>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Product> products =
          jsonResponse.map((data) => Product.fromJson(data)).toList();
      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<CategoryItem>> getCategories() async {
    var response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<CategoryItem> categories =
          jsonResponse.map((data) => CategoryItem.fromJson(data)).toList();
      return categories;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
