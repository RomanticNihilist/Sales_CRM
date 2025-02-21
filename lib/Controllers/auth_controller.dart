import 'package:get/get.dart';
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
      Get.snackbar("Success", "Logged in successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Invalid username or password",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
