import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/authentication/login.dart';
import '../services/api_service.dart';

class AuthController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final RxBool isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    bool isSuccess = await _apiService.login(username, password);
    isLoading.value = false;

    if (isSuccess) {
      // Get.offAll(() => const DocumentManagementEntryPoint());
      Get.snackbar(
        "Success", "Logged in successfully!",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "Error", "Invalid username or password",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> resetPassword(String userName) async {
    isLoading.value = true;

    bool isSuccess = await _apiService.resetPassword(userName);
    isLoading.value = false;

    if (isSuccess) {
      Get.offAll(() => LoginPage());
      Get.snackbar(
        "Success",
        "Password reset successfully!",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "Error",
        "Invalid username",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
