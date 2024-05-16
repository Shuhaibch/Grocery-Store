import 'dart:convert';

class ProductsListModel {
  final int errorCode;
  final List<ProductList> data;
  final String message;

  ProductsListModel({
    required this.errorCode,
    required this.data,
    required this.message,
  });

  ProductsListModel copyWith({
    int? errorCode,
    List<ProductList>? data,
    String? message,
  }) =>
      ProductsListModel(
        errorCode: errorCode ?? this.errorCode,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ProductsListModel.fromRawJson(String str) =>
      ProductsListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsListModel.fromJson(Map<String, dynamic> json) =>
      ProductsListModel(
        errorCode: json["error_code"],
        data: List<ProductList>.from(
            json["data"].map((x) => ProductList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class ProductList {
  final int id;
  final String name;
  final String image;
  final int price;
  final DateTime createdDate;
  final String createdTime;
  final DateTime modifiedDate;
  final String modifiedTime;
  final bool flag;

  ProductList({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.createdDate,
    required this.createdTime,
    required this.modifiedDate,
    required this.modifiedTime,
    required this.flag,
  });

  ProductList copyWith({
    int? id,
    String? name,
    String? image,
    int? price,
    DateTime? createdDate,
    String? createdTime,
    DateTime? modifiedDate,
    String? modifiedTime,
    bool? flag,
  }) =>
      ProductList(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        createdDate: createdDate ?? this.createdDate,
        createdTime: createdTime ?? this.createdTime,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        modifiedTime: modifiedTime ?? this.modifiedTime,
        flag: flag ?? this.flag,
      );

  // factory ProductList.fromRawJson(String str) => ProductList.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        createdDate: DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        modifiedDate: DateTime.parse(json["modified_date"]),
        modifiedTime: json["modified_time"],
        flag: json["flag"],
      );
  factory ProductList.fromHiveJson(json) => ProductList(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        createdDate: DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        modifiedDate: DateTime.parse(json["modified_date"]),
        modifiedTime: json["modified_time"],
        flag: json["flag"],
      );
  static ProductList empty() => ProductList(
      id: 0,
      name: '',
      image: '',
      price: 0,
      createdDate: DateTime.now(),
      createdTime: '',
      modifiedDate: DateTime.now(),
      modifiedTime: '',
      flag: false);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "price": price,
      "created_date":
          "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
      "created_time": createdTime,
      "modified_date":
          "${modifiedDate.year.toString().padLeft(4, '0')}-${modifiedDate.month.toString().padLeft(2, '0')}-${modifiedDate.day.toString().padLeft(2, '0')}",
      "modified_time": modifiedTime,
      "flag": flag,
    };
  }
}
