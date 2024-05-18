
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mechinetest/data/products/product_repository.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:mechinetest/utils/loader/loader.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final RxBool isLoading = false.obs;
  final RxList<ProductList> productList = <ProductList>[].obs;
  final RxList<ProductList> favoriteList = <ProductList>[].obs;
  final RxList<ProductList> localProductList = <ProductList>[].obs;
  final _productRepository = Get.put(ProductRepositoy());
  late final Box productBox = Hive.box('products');
  @override
  void onInit() {
    getProductsFromHive();
    super.onInit();
  }

  // fetch products
  Future<void> getAllProducts() async {
    isLoading.value = true;
    final product = await _productRepository.fetchAllProducts();
    if (product['status'] == true) {
      productList.addAll(product['data']);
      isLoading.value = false;
    } else {
      isLoading.value = false;
      CLoaders.errorSnackBar(
          title: 'Oh Snap!', message: product['data'].toString());
    }
  }

  Future<void> addProductToHive() async {
    await Hive.openBox('products');
    await getAllProducts();
    if (productBox.isEmpty) {
      productBox.clear();
      for (int i = 0; i < productList.length; i++) {
        await productBox.put(i, productList[i].toJson());
      }
    }
    isLoading.value = false;
    getProductsFromHive();
  }

  void getProductsFromHive() async {
    await Hive.openBox('products');

    if (productBox.length == 0) {
      await addProductToHive();
    }
    for (var i = 0; i < productBox.length; i++) {
      final productResp = await productBox.get(i);
      final product = ProductList.fromHiveJson(productResp);

      localProductList.add(product);
    }
  }
}
