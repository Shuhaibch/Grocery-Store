import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechinetest/data/products/product_repository.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:mechinetest/features/models/product/search_model.dart';
import 'package:mechinetest/utils/loader/loader.dart';

class ProductSearchController extends GetxController {
  static ProductSearchController get instance => Get.find();

  final RxList<SearchProduct> searchProduct = <SearchProduct>[].obs;
  final RxBool isLoading = false.obs;
  final _productRepository = Get.put(ProductRepositoy());
  TextEditingController searchCTRL = TextEditingController();

  void getSearchProduct() async {
    try {
      searchProduct.clear();

      final res = await _productRepository
          .searchProducts(searchCTRL.text.trim().toLowerCase());
      if (res['status'] == true) {
        searchProduct.clear();

        searchProduct.addAll(res['data']);
        log(searchProduct.length.toString());
        isLoading.value = false;
        if (searchProduct.isEmpty) {
          CLoaders.errorSnackBar(title: 'Oh Snap!', message: "No data found");
        }
      } else {
        searchProduct.clear();

        isLoading.value = false;
        CLoaders.errorSnackBar(
            title: 'Oh Snap!', message: res['data'].toString());
      }
    } catch (e) {
      searchProduct.clear();

      isLoading.value = false;
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: 'error Occured');
    }
  }

  void clearSearch() async {
    if (searchCTRL.text.isEmpty) {
      searchProduct.clear();
    }
  }

  ProductList convertIntoProduct(SearchProduct product) {
    return ProductList(
        id: product.id,
        name: product.name,
        image: product.image,
        price: product.price,
        createdDate: product.createdDate,
        createdTime: product.createdTime,
        modifiedDate: product.modifiedDate,
        modifiedTime: product.modifiedTime,
        flag: product.flag);
  }
}
