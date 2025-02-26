import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/services/api_service.dart';

import 'authentication/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService());
  runApp(SalesCRM());
}

class SalesCRM extends StatelessWidget {
  const SalesCRM({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales CRM App',
      home: LoginPage(),
    );
  }
}
