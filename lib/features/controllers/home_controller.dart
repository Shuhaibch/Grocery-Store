import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mechinetest/data/products/product_repository.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:mechinetest/utils/loader/loader.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final RxBool isLoading = false.obs;
  final RxList<ProductList> productList = <ProductList>[].obs;
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

  void addProductToHive() async {
    await Hive.openBox('cartBox');
    await getAllProducts();
    if (productBox.isEmpty) {
      productBox.clear();
      for (int i = 0; i < productList.length; i++) {
        await productBox.put(i, productList[i].toJson());
      }
    }
  }

  void getProductsFromHive() async {
    await Hive.openBox('cartBox');

    if (productBox.isEmpty) {
      addProductToHive();
    }
    for (var i = 0; i < productBox.length; i++) {
      final productResp = await productBox.get(i);
      final product = ProductList.fromHiveJson(productResp);

      localProductList.add(product);
    }
    print(localProductList.length);
  }
}
  // final product = ProductList(
        //     id: productResp['id'],
        //     name: productResp['name'],
        //     image: productResp['image'],
        //     price: productResp['price'],
        //     createdDate: productResp['createdDate'] ? DateFormat("2019-07-19 8:40:23"); DateTime.now(),
        //     createdTime: productResp['createdTime'] ?? '',
        //     modifiedDate: productResp['modifiedDate'] ?? DateTime.now(),
        //     modifiedTime: productResp['modifiedTime'] ?? '',
        //     flag: productResp['flag']);