import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/screen/calender_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/home/screen/home_screen.dart';

import '../../common_components/custom_appbar/controller/app_bar_controller.dart';
import '../../views/contacts/screen/contact_screen.dart';
import '../../views/leads/screen/lead_screen.dart';
import '../../views/profile/screen/profile_screen.dart';

class SalesCrmEntryPointAndroidController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;


  List<Widget> pages = [
    CalenderScreen(),
    HomeScreen(),
    LeadScreen(),
    ContactScreen(),
    ProfileScreen()
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
