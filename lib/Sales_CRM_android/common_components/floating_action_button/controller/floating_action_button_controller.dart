import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';

class FloatingActionButtonController extends GetxController{
  final SalesCrmEntryPointAndroidController _salesCrmEntryPointAndroidController = Get.find<SalesCrmEntryPointAndroidController>();

  RxInt get currentPageIndex => _salesCrmEntryPointAndroidController.currentPage;

}