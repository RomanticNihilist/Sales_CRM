import 'package:get/get.dart';
import 'package:sale_crm/data/lead_data/all_lead_data.dart';

import '../../../../../data/lead_data/converted_all_lead_data.dart';


class LeadController extends GetxController {
  var leadsList = <Lead>[].obs;
  var sortBy = 'updatedOn'.obs;

  @override
  void onInit() {
    super.onInit();
    leadsList.assignAll(allLeadData.map((lead) => Lead.fromJson(lead)).toList());
    sortLeads();
  }

  void sortLeads() {
    if (sortBy.value == 'organisationName') {
      leadsList.sort((a, b) => a.organisationName.compareTo(b.organisationName));
    } else if (sortBy.value == 'leadStatus') {
      leadsList.sort((a, b) => a.leadStatus.compareTo(b.leadStatus));
    } else if (sortBy.value == 'updatedOn') {
      leadsList.sort((a, b) => b.updatedOn.compareTo(a.updatedOn));
    }
  }
}