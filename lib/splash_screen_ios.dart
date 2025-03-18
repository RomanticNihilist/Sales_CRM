import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sale_crm/Sales_CRM_iOS/sales_CRM_entry_point_iOS/screen/sales_crm_entry_point_ios.dart';
import 'package:sale_crm/authentication/login_ios.dart';
import 'package:sale_crm/services/api_service.dart';
import '../authentication/login.dart';
import 'Sales_CRM_android/sales_crm_entry_point_android/screen/sales_crm_entry_point_android.dart'; // Import your ApiService

class SplashScreenIos extends StatelessWidget {
  final SplashControllerIos _controller = Get.put(SplashControllerIos());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/keross-logo.png'), // Your logo asset
            SizedBox(height: 20),
            const Text(
              "Sales CRM",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.white,
              ),
            ),
            SizedBox(height: 20),
            CupertinoActivityIndicator(
              color: CupertinoColors.white,
              radius: 30.0,
            ), // Loading indicator
          ],
        ),
      ),
    );
  }
}

class SplashControllerIos extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 5)); // Splash delay

    String? savedTicket = await _storage.read(key: "ticket");
    String? savedSoftwareId = await _storage.read(key: "softwareId");

    if (savedTicket != null && savedTicket.isNotEmpty) {
      bool isValid = await _apiService.validateSession(savedTicket);
      if (isValid) {
        if (savedSoftwareId != null && savedSoftwareId.isNotEmpty) {
          _apiService.softwareId.value = savedSoftwareId;
        }
        Get.offAll(() => SalesCrmEntryPointIOS());
      } else {
        _apiService.logout();
        Get.off(() => LoginPageIos());
      }
    } else {
      Get.off(() => LoginPageIos());
    }
  }
}
