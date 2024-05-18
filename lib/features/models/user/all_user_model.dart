import 'dart:convert';

AllUserModelList allUserModelListFromJson(String str) =>
    AllUserModelList.fromJson(json.decode(str));

String allUserModelListToJson(AllUserModelList data) =>
    json.encode(data.toJson());

class AllUserModelList {
  int errorCode;
  List<AllUser> data;
  String message;

  AllUserModelList({
    required this.errorCode,
    required this.data,
    required this.message,
  });

  AllUserModelList copyWith({
    int? errorCode,
    List<AllUser>? data,
    String? message,
  }) =>
      AllUserModelList(
        errorCode: errorCode ?? this.errorCode,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AllUserModelList.fromJson(Map<String, dynamic> json) =>
      AllUserModelList(
        errorCode: json["error_code"],
        data: List<AllUser>.from(json["data"].map((x) => AllUser.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class AllUser {
  int id;
  String name;
  String profilePic;
  String mobileNumber;
  String email;
  String street;
  String streetTwo;
  String city;
  int pincode;
  String country;
  String state;
  DateTime createdDate;
  String createdTime;
  DateTime modifiedDate;
  String modifiedTime;
  bool flag;

  AllUser({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.mobileNumber,
    required this.email,
    required this.street,
    required this.streetTwo,
    required this.city,
    required this.pincode,
    required this.country,
    required this.state,
    required this.createdDate,
    required this.createdTime,
    required this.modifiedDate,
    required this.modifiedTime,
    required this.flag,
  });

  AllUser copyWith({
    int? id,
    String? name,
    String? profilePic,
    String? mobileNumber,
    String? email,
    String? street,
    String? streetTwo,
    String? city,
    int? pincode,
    String? country,
    String? state,
    DateTime? createdDate,
    String? createdTime,
    DateTime? modifiedDate,
    String? modifiedTime,
    bool? flag,
  }) =>
      AllUser(
        id: id ?? this.id,
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        street: street ?? this.street,
        streetTwo: streetTwo ?? this.streetTwo,
        city: city ?? this.city,
        pincode: pincode ?? this.pincode,
        country: country ?? this.country,
        state: state ?? this.state,
        createdDate: createdDate ?? this.createdDate,
        createdTime: createdTime ?? this.createdTime,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        modifiedTime: modifiedTime ?? this.modifiedTime,
        flag: flag ?? this.flag,
      );
  static AllUser empty() => AllUser(
        id: 0,
        name: '',
        profilePic: '',
        mobileNumber: '',
        email: '',
        street: '',
        streetTwo: '',
        city: '',
        pincode: 0,
        country: '',
        state: '',
        createdDate: DateTime.now(),
        createdTime: '',
        modifiedDate: DateTime.now(),
        modifiedTime: '',
        flag: false,
      );
      
  factory AllUser.fromJson(Map<String, dynamic> json) => AllUser(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"] ?? '',
        mobileNumber: json["mobile_number"],
        email: json["email"],
        street: json["street"],
        streetTwo: json["street_two"],
        city: json["city"],
        pincode: json["pincode"],
        country: json["country"],
        state: json["state"],
        createdDate: DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        modifiedDate: DateTime.parse(json["modified_date"]),
        modifiedTime: json["modified_time"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic,
        "mobile_number": mobileNumber,
        "email": email,
        "street": street,
        "street_two": streetTwo,
        "city": city,
        "pincode": pincode,
        "country": country,
        "state": state,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "created_time": createdTime,
        "modified_date":
            "${modifiedDate.year.toString().padLeft(4, '0')}-${modifiedDate.month.toString().padLeft(2, '0')}-${modifiedDate.day.toString().padLeft(2, '0')}",
        "modified_time": modifiedTime,
        "flag": flag,
      };
}
