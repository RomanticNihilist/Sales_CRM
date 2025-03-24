import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/services/api_service.dart';
import 'package:sale_crm/splash_screen.dart';
import 'authentication/login_ios.dart';
import 'splash_screen_ios.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService());
  runApp(SalesCRM());
}

class SalesCRM extends StatelessWidget {
  const SalesCRM({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sales CRM App',
        home: SplashScreen(),
      );
      // return GetCupertinoApp(
      //   debugShowCheckedModeBanner: false,
      //   title: "Sales CRM IOS",
      //   home: SplashScreenIos(),
      // );
    }
    else{
      return GetCupertinoApp(
        debugShowCheckedModeBanner: false,
        title: "Sales CRM IOS",
        home: LoginPageIos(),
      );
    }
    //
    // return GetCupertinoApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "Sales CRM IOS",
    //   home: LoginPageIos(),
    // );
  }
}
