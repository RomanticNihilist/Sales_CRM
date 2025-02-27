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
      return SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.blue,
        children: _floatingActionButtonController.getSpeedDialOptions(),
      );
    });
  }
}