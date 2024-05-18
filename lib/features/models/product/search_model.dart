
import 'dart:convert';

SearchModelList searchModelListFromJson(String str) => SearchModelList.fromJson(json.decode(str));

String searchModelListToJson(SearchModelList data) => json.encode(data.toJson());

class SearchModelList {
    int errorCode;
    List<SearchProduct> data;
    String message;

    SearchModelList({
        required this.errorCode,
        required this.data,
        required this.message,
    });

    SearchModelList copyWith({
        int? errorCode,
        List<SearchProduct>? data,
        String? message,
    }) => 
        SearchModelList(
            errorCode: errorCode ?? this.errorCode,
            data: data ?? this.data,
            message: message ?? this.message,
        );

    factory SearchModelList.fromJson(Map<String, dynamic> json) => SearchModelList(
        errorCode: json["error_code"],
        data: List<SearchProduct>.from(json["data"].map((x) => SearchProduct.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class SearchProduct {
    int id;
    String name;
    String image;
    int price;
    DateTime createdDate;
    String createdTime;
    DateTime modifiedDate;
    String modifiedTime;
    bool flag;

    SearchProduct({
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

    SearchProduct copyWith({
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
        SearchProduct(
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

    factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "created_time": createdTime,
        "modified_date": "${modifiedDate.year.toString().padLeft(4, '0')}-${modifiedDate.month.toString().padLeft(2, '0')}-${modifiedDate.day.toString().padLeft(2, '0')}",
        "modified_time": modifiedTime,
        "flag": flag,
    };
}
