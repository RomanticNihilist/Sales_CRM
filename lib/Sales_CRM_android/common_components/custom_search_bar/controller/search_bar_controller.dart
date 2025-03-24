import 'package:get/get.dart';

import '../../../../data/lead_data/all_lead_data.dart';
import '../../../../data/lead_data/converted_all_lead_data.dart';


class LeadController extends GetxController {
  var leadsList = <Lead>[].obs;
  var filteredLeadsList = <Lead>[].obs;
  var sortBy = 'updatedOn'.obs;
  var isSearchVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    leadsList.assignAll(allLeadData.map((lead) => Lead.fromJson(lead)).toList());
    filteredLeadsList.assignAll(leadsList);
    sortLeads();
  }

  void toggleSearchVisibility() {
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
}
