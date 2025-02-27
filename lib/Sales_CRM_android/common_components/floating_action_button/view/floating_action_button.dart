import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/floating_action_button/controller/floating_action_button_controller.dart';

class FloatingActionButtonComponent extends StatelessWidget{
  FloatingActionButtonComponent({super.key});
  final FloatingActionButtonController _floatingActionButtonController = Get.put(FloatingActionButtonController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int currentPage = _floatingActionButtonController.currentPageIndex.value;

      List<SpeedDialChild> getSpeedDialOptions() {
        if (currentPage == 2) {
          return [
            SpeedDialChild(
              child: Icon(Icons.person_add),
              label: "Add Lead",
              onTap: () => print("Add Lead Clicked"),
            ),
            SpeedDialChild(
              child: Icon(Icons.import_contacts),
              label: "Import from Address Book",
              onTap: () => print("Import Lead Clicked"),
            ),
          ];
        } else if (currentPage == 3) {
          return [
            SpeedDialChild(
              child: Icon(Icons.person_add),
              label: "Add Contact",
              onTap: () => print("Add Contact Clicked"),
            ),
            SpeedDialChild(
              child: Icon(Icons.import_contacts),
              label: "Import from Address Book",
              onTap: () => print("Import Contact Clicked"),
            ),
          ];
        } else {
          return [];
        }
      }

      return SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.blue,
        children: getSpeedDialOptions(),
      );
    });
  }
}