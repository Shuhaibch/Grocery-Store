import 'dart:convert';
import 'package:get/get.dart';
import 'package:mechinetest/utils/loader/loader.dart';
import 'package:mechinetest/utils/storage/storage_utility.dart';


class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  //* Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // methord to initialize favrites by reading from the Storage3
  void initFavorites() {
    final json = CLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoriteToStorage();
      CLoaders.customToast(message: "Product has been added to the Whishlist");
    } else {
      CLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoriteToStorage();
      favorites.refresh();
      CLoaders.customToast(
          message: "Product has been removed from the Whishlist");
    }
  }

  void saveFavoriteToStorage() {
    final encodedFavorites = json.encode(favorites);
    CLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  // Future<List<ProductList>> favoriteProducts() async {
  //   final cartItemStrings =
  //       CLocalStorage.instance().readData<List<dynamic>>('cartItems');
  //   if (cartItemStrings != null) {
  //     favoriteList.assignAll(cartItemStrings
  //         .map((item) => ProductList.fromJson(item as Map<String, dynamic>)));
  //   }
  // }
}