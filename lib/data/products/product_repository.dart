import 'dart:convert';

import 'package:get/get.dart';
import 'package:mechinetest/commen/http/base_uri.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:http/http.dart' as http;

class ProductRepositoy extends GetxController {
  static ProductRepositoy get instance => Get.find();
  fetchAllProducts() async {
    try {
      var responce = await http.get(
        Uri.parse('${CBaseURI.baseURL}products/'),
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final ProductsListModel productRes =
            ProductsListModel.fromJson(jsonDecode(responce.body));
        final List<ProductList> productList = productRes.data;
        return {"status": true, "data": productList};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      return {"status": false, "data": 'Error Occured'};
    }
  }
}
