import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/services/api_service.dart';

import 'login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX API Example',
      home: LoginPage(),
    );
  }
}
