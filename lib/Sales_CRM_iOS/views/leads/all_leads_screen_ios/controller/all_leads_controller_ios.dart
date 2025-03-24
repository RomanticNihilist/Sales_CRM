import 'package:get/get.dart';
import 'package:sale_crm/data/lead_data/all_lead_data.dart';

import '../../../../../data/lead_data/converted_all_lead_data.dart';

class AllLeadsControllerIos extends GetxController {
  var leadsList = <Lead>[].obs;
  var sortBy = 'updatedOn'.obs;
  var sortByName = 'Updated On'.obs;

  @override
  void onInit() {
    super.onInit();
    leadsList.assignAll(allLeadData.map((lead) => Lead.fromJson(lead)).toList());
    sortLeads();
  }

  /// Sort leads based on the selected attribute.
  void sortLeads() {
    if (sortBy.value == 'organisationName') {
      leadsList.sort((a, b) => a.organisationName.compareTo(b.organisationName));
      sortByName.value = 'Organisation Name';
    } else if (sortBy.value == 'leadStatus') {
      leadsList.sort((a, b) => a.leadStatus.compareTo(b.leadStatus));
      sortByName.value = 'Lead Status';
    } else if (sortBy.value == 'updatedOn') {
      // Sort by updated date descending so latest is on top.
      leadsList.sort((a, b) => b.updatedOn.compareTo(a.updatedOn));
      sortByName.value = 'Updated On';
    }
  }
}