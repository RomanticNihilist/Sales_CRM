import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';
import '../../../utils/color_constants.dart';


class MoreBottomAppBarItem extends StatelessWidget {
  final SalesCrmEntryPointAndroidController controller;

  const MoreBottomAppBarItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    bool isSelected = controller.currentPage.value >= 4;
    return ZoomTapAnimation(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("Account"),
                  onTap: () {
                    Navigator.pop(context);
                    controller.animateToTab(4);
                  },
                ),
                ListTile(
                  title: const Text("Deals"),
                  onTap: () {
                    Navigator.pop(context);
                    controller.animateToTab(5);
                  },
                ),
                ListTile(
                  title: const Text("Task"),
                  onTap: () {
                    Navigator.pop(context);
                    controller.animateToTab(6);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz,
              color: isSelected ? ColorConstants.appColors : Colors.grey,
              size: 20,
            ),
            Text(
              "More",
              style: TextStyle(
                color: isSelected ? ColorConstants.appColors : Colors.grey,
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
