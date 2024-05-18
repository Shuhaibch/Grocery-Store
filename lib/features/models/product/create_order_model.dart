import 'dart:convert';

CreateOrderModel createOrderModelFromJson(String str) =>
    CreateOrderModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderModel data) =>
    json.encode(data.toJson());

class CreateOrderModel {
  int customerId;
  int totalPrice;
  List<OrderList> products;

  CreateOrderModel({
    required this.customerId,
    required this.totalPrice,
    required this.products,
  });

  CreateOrderModel copyWith({
    int? customerId,
    int? totalPrice,
    List<OrderList>? products,
  }) =>
      CreateOrderModel(
        customerId: customerId ?? this.customerId,
        totalPrice: totalPrice ?? this.totalPrice,
        products: products ?? this.products,
      );

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderModel(
        customerId: json["customer_id"],
        totalPrice: json["total_price"],
        products: List<OrderList>.from(
            json["products"].map((x) => OrderList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "total_price": totalPrice,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class OrderList {
  int productId;
  int quantity;
  int price;

  OrderList({
    required this.productId,
    required this.quantity,
    required this.price,
  });
  static OrderList empty = OrderList(productId: 0, quantity: 0, price: 0);

  OrderList copyWith({
    int? productId,
    int? quantity,
    int? price,
  }) =>
      OrderList(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
      };
}
