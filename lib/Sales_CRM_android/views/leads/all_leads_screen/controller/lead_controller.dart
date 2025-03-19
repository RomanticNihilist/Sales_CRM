import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../../data/lead_data/all_lead_data.dart';
import '../../../../../data/lead_data/converted_all_lead_data.dart';

class LeadController extends GetxController with GetSingleTickerProviderStateMixin{
  var leadsList = <Lead>[].obs;
  var filteredLeadsList = <Lead>[].obs;
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

    leadsList.assignAll(allLeadData.map((lead) => Lead.fromJson(lead)).toList());
    filteredLeadsList.assignAll(leadsList);
    sortLeads();


    /// This code is not working, tried to fix it but it doesn't work, so I'm commenting it out for now
    /// The search bar is coming with the animation but not going reverse animationController.reverse() with the same animation.
    // // Add listener to detect when the animation finishes
    // animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     // When the animation is dismissed (finished reverse), hide the search bar
    //     isSearchVisible.value = false;
    //   }
    // });
  }

  void toggleSearchVisibility() {
    if (isSearchVisible.value) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
    isSearchVisible.value = !isSearchVisible.value;
  }


  void filterLeads(String query) {
    filteredLeadsList.assignAll(
      leadsList.where((lead) {
        return lead.organisationName.toLowerCase().contains(query.toLowerCase()) ||
            lead.leadStatus.toLowerCase().contains(query.toLowerCase()) ||
            lead.updatedOn.toString().contains(query);
      }).toList(),
    );
    sortLeads();
  }

  void sortLeads() {
    if (sortBy.value == 'organisationName') {
      filteredLeadsList.sort((a, b) => a.organisationName.compareTo(b.organisationName));
    } else if (sortBy.value == 'leadStatus') {
      filteredLeadsList.sort((a, b) => a.leadStatus.compareTo(b.leadStatus));
    } else if (sortBy.value == 'updatedOn') {
      filteredLeadsList.sort((a, b) => b.updatedOn.compareTo(a.updatedOn));
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
