import 'package:get/get.dart';
import 'package:mechinetest/features/controllers/cart_controller.dart';
import 'package:mechinetest/features/controllers/home_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(HomeController());
  }
}
