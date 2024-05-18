import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mechinetest/data/user/user_repository.dart';
import 'package:mechinetest/features/models/user/all_user_model.dart';
import 'package:mechinetest/utils/loader/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  @override
  void onInit() {
    getAllUser();
    super.onInit();
  }

  Rx<AllUser> selectedUser = AllUser.empty().obs;
  RxBool isLoading = false.obs;
  RxList<AllUser> allUserList = <AllUser>[].obs;
  RxList<AllUser> searchList = <AllUser>[].obs;
  TextEditingController searchCTRL = TextEditingController();

  void clearSearch() async {
    if (searchCTRL.text.isEmpty) {
      searchList.clear();
    }
  }

  void selectCurrentUser(AllUser user) {
    selectedUser.value = user;
    CLoaders.successSnackBar(title: 'Customer Updated');
  }

  final _userRepository = Get.put(UserRepositoy());
  void getAllUser() async {
    try {
      isLoading.value = true;
      final res = await _userRepository.fetchAllUser();
      if (res['status'] == true) {
        allUserList.addAll(res['data']);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        CLoaders.errorSnackBar(
            title: 'Oh Snap!', message: res['data'].toString());
      }
    } catch (e) {
      isLoading.value = false;
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void searchUser() async {
    try {
      searchList.clear();

      isLoading.value = true;
      final res = await _userRepository
          .searchUser(searchCTRL.text.trim().toLowerCase());
      if (res['status'] == true) {
        searchList.clear();

        searchList.addAll(res['data']);
        isLoading.value = false;
        if (searchList.isEmpty) {
          CLoaders.errorSnackBar(title: 'Oh Snap!', message: "No data found");
        }
      } else {
        searchList.clear();

        isLoading.value = false;
        CLoaders.errorSnackBar(
            title: 'Oh Snap!', message: res['data'].toString());
      }
    } catch (e) {
      searchList.clear();

      isLoading.value = false;
      CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
