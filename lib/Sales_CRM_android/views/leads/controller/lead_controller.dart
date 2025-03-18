import 'package:get/get.dart';
import 'package:sale_crm/data/lead_data/all_lead_data.dart';

import '../../../../data/lead_data/converted_all_lead_data.dart';

class LeadController extends GetxController {
  var leadsList = <Lead>[].obs;
  var sortBy = 'updatedOn'.obs;

  @override
  void onInit() {
    super.onInit();
    // Here, you could load your leads data.
    // For example, if you already have your raw list, parse it into Lead objects.
    // Example:
    // leadsList.assignAll(yourRawLeads.map((lead) => Lead.fromJson(lead)).toList());
    // For demonstration, I'll add dummy data:

    leadsList.assignAll(allLeadData.map((lead) => Lead.fromJson(lead)).toList());
    sortLeads();
  }

  /// Sort leads based on the selected attribute.
  void sortLeads() {
    if (sortBy.value == 'organisationName') {
      leadsList.sort((a, b) => a.organisationName.compareTo(b.organisationName));
    } else if (sortBy.value == 'leadStatus') {
      leadsList.sort((a, b) => a.leadStatus.compareTo(b.leadStatus));
    } else if (sortBy.value == 'updatedOn') {
      // Sort by updated date descending so latest is on top.
      leadsList.sort((a, b) => b.updatedOn.compareTo(a.updatedOn));
    }
  }
}