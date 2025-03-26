import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/all_leads_screen/controller/lead_controller.dart';

class SearchBarController extends GetxController with GetSingleTickerProviderStateMixin {
  final LeadController leadController = Get.find<LeadController>();
  var sortBy = 'updatedOn'.obs;
  var isSearchVisible = false.obs;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
  }

  void toggleSearchVisibility() {
    isSearchVisible.value = !isSearchVisible.value;
    // Optionally, you might want to sync this with leadController.isSearchVisible
  }

  void filterLeads(String query) {
    leadController.filterLeads(query);
  }

  void sortLeads() {
    leadController.sortBy.value = sortBy.value;
    leadController.sortLeads();
  }
}
