import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mechinetest/commen/http/base_uri.dart';
import 'package:mechinetest/features/models/product/create_order_model.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:mechinetest/features/models/product/search_model.dart';

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

  searchProducts(String quary) async {
    try {
      var responce = await http.get(
        Uri.parse('${CBaseURI.baseURL}products/?search_query=$quary'),
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final SearchModelList productRes =
            SearchModelList.fromJson(jsonDecode(responce.body));
        final List<SearchProduct> productList = productRes.data;
        return {"status": true, "data": productList};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      return {"status": false, "data": 'Error Occured'};
    }
  }

  createOrder(CreateOrderModel order) async {
   
    try {
      log(order.toJson().toString());
      var responce = await http.post(Uri.parse('${CBaseURI.baseURL}orders/'),
          body: jsonEncode(order.toJson()),
          headers: {"Content-type": "application/json"});
      log(responce.statusCode.toString());
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final res = jsonDecode(responce.body);
        if (res["message"] == "success") {
          return {"status": true, "data": 'success'};
        }
        return {"status": false, "data": ''};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      log(e.toString());
      return {"status": false, "data": 'Error Occured'};
    }
  }
}
