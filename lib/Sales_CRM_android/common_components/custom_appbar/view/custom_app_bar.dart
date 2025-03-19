import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/app_bar_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarController _appBarController = Get.put(AppBarController());

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String title = _appBarController.getAppBarTitle();
      return AppBar(
        backgroundColor: Colors.blue, // Background color
        title: Text(
          title,
          style: const TextStyle(color: Colors.white), // White text color
        ),
        leading: IconButton(
          icon: Icon(_appBarController.getLeftIcon(title), color: Colors.white),
          onPressed: () {
            // Handle left icon action (e.g., drawer open)
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search, color: Colors.white),
        //     onPressed: () {
        //       // Handle search action
        //     },
        //   ),
        // ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
