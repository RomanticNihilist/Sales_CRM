import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common_components_ios/generic_dropdown/controller/generic_dropdown_contoller_ios.dart';

class AddDealFormControllerIos extends GetxController {
  GenericDropdownControllerIos<String> currencyDropdownController =
  GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );

  GenericDropdownControllerIos<String> accountNameDropdownController =
  GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );
  GenericDropdownControllerIos<String> accountManagerDropdownController =
  GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );

  GenericDropdownControllerIos<String> productNameDropdownController =
  GenericDropdownControllerIos<String>(
    displayValue: (item) => item,
  );

  // Example lists for the dropdowns (can be fetched from an API or database)
  final currency = ['USD', 'GBP', 'INR', 'QAR','SAR','AED'];
  final accountName  = ['Shopanova', 'Gleeds', 'MTN', 'Dedalus','URC global','Keross holding'];
  final manager = ['Farouk said'];
  final product = ['HCM','CCC','ITSM','SSD','Sales CRM'];


  // Controllers for each input field
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController expectedRevenueController = TextEditingController();
  TextEditingController numberOfEmployeesController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountManagerController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();


  // Method to save the contact information (logic can be added here)
  void saveDeal() {
    // You can validate the fields and save the contact information
    print('Organization Name: ${organizationNameController.text}');
    print('Email: ${emailController.text}');
    print('Contact Number: ${expectedRevenueController.text}');
    print('Number of Employees: ${numberOfEmployeesController.text}');
    print('Sector: ${currencyController.text}');
    print('Source: ${accountNameController.text}');
    print('Website: ${accountManagerController.text}');
    print('Street: ${productNameController.text}');
    print('City: ${productDescriptionController.text}');

  }
}
