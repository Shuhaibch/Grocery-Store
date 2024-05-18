class CartItemModel {
  int productId;
  String name;
  int price;
  String? image;
  int quantity;
  CartItemModel({
    required this.productId,
    required this.name,
    required this.price,
    this.image,
    required this.quantity,
  });
  static CartItemModel empty() =>
      CartItemModel(productId: 0, name: '', price: 0, quantity: 0);
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productId': productId,
      'title': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'] as int,
      name: map['title'] as String,
      price: map['price'] as int,
      image: map['image'] != null ? map['image'] as String : null,
      quantity: map['quantity'] as int , 
    );
  }
  factory CartItemModel.fromHiveJson( map) {
    return CartItemModel(
      productId: map['productId'] as int,
      name: map['title'] as String,
      price: map['price'] as int,
      image: map['image'] != null ? map['image'] as String : null,
      quantity: map['quantity'] as int , 
    );
  }
}
