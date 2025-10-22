import 'package:enrope/model/userModel/userModel.dart';
import 'package:enrope/services/userAPi/userApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usercontroller extends GetxController {
  final Userapi _api = Userapi();

  var users = <UserModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final data = await _api.getUsers();
      users.assignAll(data);
    } catch (e) {
      throw Exception('Failed to load post');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addUser(String name) async {
    final newUser = await _api.addUser(name);
    users.add(newUser);
    Get.snackbar(
      backgroundColor: Colors.green,
      colorText: Colors.white,

      'Success: ${newUser.name}',
      'User added successfully',
    );
  }

  Future<void> deleteUser(String id, String name) async {
    await _api.deleteUser(id);
    users.removeWhere((user) => user.id == id);
    Get.snackbar(
      'Success: $name',
      ' User  delete successfully }',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
