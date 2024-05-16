import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mechinetest/features/models/product/cart_item_model.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:mechinetest/utils/loader/loader.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItem = <CartItemModel>[].obs;
  late final Box cartBox = Hive.box('cart');

  //*  addToCArt
  // void addToCart(ProductList product) async {
  //   if (productQuantityInCart.value < 1) {
  //     CLoaders.customToast(message: 'Select Quantity');
  //     return;
  //   }
  //   // Convert ProductModel into cartModel with the given quantty
  //   final selectedCartItem =
  //       convertToCartItem(product, productQuantityInCart.value);

  //   // Check if already added in the cart
  //   int index = cartItem.indexWhere(
  //       (cartItem) => cartItem.productId == selectedCartItem.productId);

  //   if (index >= 0) {
  //     // This quantity is already added or updated/removed form the design(Cart)
  //     cartItem[index].quantity = selectedCartItem.quantity;
  //   } else {
  //     cartItem.add(selectedCartItem);
  //   }

  //   updateCart();
  //   CLoaders.customToast(message: 'Your product has been added to the cart.');
  // }

  void addOneToCart(CartItemModel item) {
    int index =
        cartItem.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      cartItem[index].quantity += 1;
    } else {
      cartItem.add(item);
    }
    updateCart();
  }

  RxInt getProductCartQuantity(ProductList product) {
    final item = convertToCartItem(product, 1);

    if (cartItem.contains(item)) {
      final index = cartItem
          .indexWhere((cartItem) => cartItem.productId == item.productId);
      return cartItem[index].quantity.obs;
    }
    return 0.obs;
  }

  void removeOneFromCart(CartItemModel item) {
    int index =
        cartItem.indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      if (cartItem[index].quantity > 1) {
        cartItem[index].quantity -= 1;
      } else {
        // show dialog before completely removing
        cartItem[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItem.removeAt(index);
      }
      updateCart();
    }
  }

  int getProductQuantityinCart(int productId) {
    final foundItem = cartItem
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundItem;
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        // remove the item from the cart
        cartItem.removeAt(index);
        updateCart();
        CLoaders.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  CartItemModel convertToCartItem(ProductList product, int quantity) {
    return CartItemModel(
        productId: product.id,
        name: product.name,
        price: product.price,
        quantity: quantity);
  }

  //* Update Cart Values
  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItem.refresh();
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItem) {
      calculatedTotalPrice = (item.price) * item.quantity.toDouble();
      calculatedNoOfItems = item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() async {
    await Hive.openBox('cartBox');
    final cartItemStrings = cartItem.map((item) => item.toJson()).toList();
    cartBox.put('cartItems', cartItemStrings);
  }

  void loadCartItems() async {
    final cartItemStrings =
        // CLocalStorage.instance().readData<List<dynamic>>('cartItems');
        await cartBox.get('cartItems');
    if (cartItemStrings != null) {
      cartItem.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }
}
