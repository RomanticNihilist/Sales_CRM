import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/color_constants.dart';
import '../controller/sales_crm_entry_point_android_controller.dart';

class SalesCrmEntryPointAndroid extends StatelessWidget{
  SalesCrmEntryPointAndroid({super.key});
  final SalesCrmEntryPointAndroidController _salesCrmEntryPointAndroidController = Get.put(SalesCrmEntryPointAndroidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sales CRM App",
        ),
        centerTitle: false,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Obx(
              ()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _bottomAppBarItem(
                      context,
                      icon: IconlyLight.calendar,
                      page: 0,
                      label: "Calender"
                  ),
                  _bottomAppBarItem(
                      context,
                      icon: IconlyLight.home,
                      page: 1,
                      label: "Home"
                  ),
                  _bottomAppBarItem(
                      context,
                      icon: IconlyLight.bookmark,
                      page: 2,
                      label: "Leads"
                  ),
                  _bottomAppBarItem(
                      context,
                      icon: IconlyLight.calling,
                      page: 3,
                      label: "Contacts"
                  ),
                  _bottomAppBarItem(
                      context,
                      icon: IconlyLight.profile,
                      page: 4,
                      label: "Profile"
                  )

                ],
              )

          ),
        ),
      ),
      body: PageView(
        controller: _salesCrmEntryPointAndroidController.pageController,
        onPageChanged: (index) {
          _salesCrmEntryPointAndroidController.currentPage.value = index;
        },
        children: _salesCrmEntryPointAndroidController.pages,
      ),
    );
  }


  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => _salesCrmEntryPointAndroidController.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _salesCrmEntryPointAndroidController.currentPage == page
                  ? ColorConstants.appColors
                  : Colors.grey,
              size: 20,
            ),
            Text(
              label,
              style: TextStyle(
                  color: _salesCrmEntryPointAndroidController.currentPage == page
                      ? ColorConstants.appColors
                      : Colors.grey,
                  fontSize: 13,
                  fontWeight: _salesCrmEntryPointAndroidController.currentPage == page
                      ? FontWeight.w600
                      : null),
            ),
          ],
        ),
      ),
    );
  }

}