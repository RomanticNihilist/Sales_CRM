import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_bar_controller.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarController _appBarController = Get.put(AppBarController());

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return AppBar(
        title: Text(_appBarController.getAppBarTitle()),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
