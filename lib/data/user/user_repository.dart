import 'dart:convert';

import 'package:get/get.dart';
import 'package:mechinetest/commen/http/base_uri.dart';
import 'package:http/http.dart' as http;
import 'package:mechinetest/features/models/user/all_user_model.dart';

class UserRepositoy extends GetxController {
  static UserRepositoy get instance => Get.find();

  fetchAllUser() async {
    try {
      var responce = await http.get(
        Uri.parse('${CBaseURI.baseURL}customers/'),
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final AllUserModelList productRes =
            AllUserModelList.fromJson(jsonDecode(responce.body));
        final List<AllUser> userList = productRes.data;
        return {"status": true, "data": userList};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      return {"status": false, "data": 'Error Occured'};
    }
  }
  searchUser(String quary) async {
      try {
        var responce = await http.get(
          Uri.parse('${CBaseURI.baseURL}customers/?search_query=$quary'),
        );
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          final AllUserModelList productRes =
              AllUserModelList.fromJson(jsonDecode(responce.body));
          final List<AllUser> userList = productRes.data;
          return {"status": true, "data": userList};
        } else {
          return {"status": false, "data": responce.body};
        }
      } catch (e) {
        return {"status": false, "data": 'Error Occured'};
      }
    }
}
