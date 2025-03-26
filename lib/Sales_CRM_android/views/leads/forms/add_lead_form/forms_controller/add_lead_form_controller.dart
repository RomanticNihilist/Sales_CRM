import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../components/generic_dropdown_component/controller/generic_dropdown_controller.dart';
import '../../../../../../data/lead_data/converted_all_lead_data.dart';
import '../../../all_leads_screen/controller/lead_controller.dart';

class LeadFormController extends GetxController {
  final LeadController leadController = Get.find<LeadController>();

  var isExpanded = false.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  GenericDropdownController<String> sectorDropdownController =
  GenericDropdownController<String>(displayValue: (item) => item);

  GenericDropdownController<String> sourceDropdownController =
  GenericDropdownController<String>(displayValue: (item) => item);

  GenericDropdownController<String> countryDropdownController =
  GenericDropdownController<String>(displayValue: (item) => item);

  TextEditingController organizationNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController numberOfEmployeesController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void saveLead() {
    final Lead lead = Lead(
      email: emailController.text,
      leadStatus: "Lead Created",
      noOfEmployees: numberOfEmployeesController.text,
      organisationName: organizationNameController.text,
      orgContactNo: contactNumberController.text,
      sector: sectorController.text,
      salesManager: "Agniva Bhattacharjee",
      updatedOn: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour,
        DateTime.now().minute,
      ),
      leadIdentifier: Uuid().v4(),
    );
    leadController.addLead(lead);
    Get.back();
  }
}
