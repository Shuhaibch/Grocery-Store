import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mechinetest/data/products/product_repository.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/controllers/home_controller.dart';
import 'package:mechinetest/features/controllers/user_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(HomeController());
    Get.put(UserController());
    Get.put(ProductRepositoy());
  }

  final deviceStorage = GetStorage();
}
