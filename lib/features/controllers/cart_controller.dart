import 'package:get/get.dart';
import 'package:mechinetest/data/products/product_repository.dart';
import 'package:mechinetest/features/controllers/user_controller.dart';
import 'package:mechinetest/features/models/product/cart_item_model.dart';
import 'package:mechinetest/features/models/product/create_order_model.dart';
import 'package:mechinetest/features/models/product/product_list_model.dart';
import 'package:mechinetest/navigation_menu.dart';
import 'package:mechinetest/utils/loader/loader.dart';
import 'package:mechinetest/utils/storage/storage_utility.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  CartController() {
    loadCartItems();
  }

  //* Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItem = <CartItemModel>[].obs;
  final _productRepository = Get.put(ProductRepositoy());
  RxBool isLoading = false.obs;
  final _userController = Get.put(UserController());

  // //* add product to cart
  void addToCart(ProductList product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      CLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Convert ProductModel into cartModel with the given quantty
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    // Check if already added in the cart
    int index = cartItem.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItem.productId);

    if (index >= 0) {
      // This quantity is already added or updated/removed form the design(Cart)
      cartItem[index].quantity = selectedCartItem.quantity;
    } else {
      cartItem.add(selectedCartItem);
    }

    updateCart();
    // CLoaders.customToast(message: 'Your product has been added to the cart.');
  }

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

  //*  initialize already added item's count in cart.
  void updateAlreadyAddedProductCount(ProductList product) {
    productQuantityInCart.value = getProductQuantityinCart(product.id);
  }

  //* This function convert ProductModel into cartItemModel
  CartItemModel convertToCartItem(ProductList product, int quantity) {
    return CartItemModel(
        productId: product.id,
        name: product.name,
        price: product.price,
        quantity: quantity,
        image: product.image);
  }

  int cartIndex(ProductList product) {
    int index =
        cartItem.indexWhere((cartItem) => cartItem.productId == product.id);
    return index;
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
      final total = ((item.price) * item.quantity).toDouble();

      calculatedTotalPrice = calculatedTotalPrice + total;
      calculatedNoOfItems = calculatedNoOfItems + 1;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItem.map((item) => item.toJson()).toList();
    CLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        CLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItem.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityinCart(int productId) {
    final foundItem = cartItem
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItem.clear();
    updateCart();
  }

  void createOrder() async {
    try {
      isLoading.value = true;
      List<OrderList> orderList = [];
      for (var element in cartItem) {
        final order = OrderList(
            productId: element.productId,
            quantity: element.quantity,
            price: element.price);
        orderList.add(order);
      }
      CreateOrderModel order = CreateOrderModel(
          customerId: _userController.selectedUser.value.id,
          totalPrice: totalCartPrice.value.toInt(),
          products: orderList);
      if (order.customerId == 0) {
        CLoaders.errorSnackBar(
            title: 'Alert!', message: 'Select Customer before poceeding');
      }
      var res = await _productRepository.createOrder(order);
      if (res['status'] == true) {
        clearCart();
        isLoading.value = false;
        CLoaders.successSnackBar(
            title: 'YAAY!', message: 'Order Placed Successfully');

        Get.offAll(() => const NavigationMenu());
      } else {
        isLoading.value = false;
        CLoaders.errorSnackBar(
            title: 'OOPS!', message: 'Failed to place Order');
      }
    } catch (e) {
      isLoading.value = false;
      CLoaders.errorSnackBar(title: 'OOPS!', message: 'Failed to place Order');

      print(e);
    }
  }
}
