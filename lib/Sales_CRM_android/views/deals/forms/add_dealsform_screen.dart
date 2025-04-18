import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/forms/add_deals_controller.dart';
import 'package:sale_crm/components/custom_input.dart';
import 'package:sale_crm/components/generic_dropdown_component/UI/generic_dropdown.dart';

class AddDealsFormScreen extends StatelessWidget {
  const AddDealsFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DealsFormcontroller());
    final currency = ['USD', 'GBP', 'INR', 'QAR', 'SAR', 'AED'];
    final accountName = [
      "Keross R&D",
      "MTN",
      "SHELL",
      "URC GLOBAL",
      "SOHOM TESTED"
    ];

    final productName = [
      "Professional Service",
      "User License",
      "Service level Agreement  ",
      "Test App",
      "Supplier management",
      "Hcm",
      "Ssd"
    ];

    final accountManager = [
      "Nirupam sir",
      "Kunal sir",
      "Arup sir",
      "Saranik sir"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Deals',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, size: 28),
            onPressed: () {
              print("this is all about rules");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader('DEALS INFORMATION'),
              _buildCard([
                CustomInput(
                  labelText: 'Deal No',
                  isMandatory: true,
                  controller: controller.DealNoController,
                  inputType: InputType.number,
                  prefixIcon: const Icon(Icons.format_list_numbered_rtl_sharp),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'Deal Name',
                  controller: controller.DealNameController,
                  inputType: InputType.text,
                  isMandatory: true,
                  prefixIcon: const Icon(Icons.data_thresholding),
                ),
                const SizedBox(height: 16),
                GenericDropdown<String>(
                  labelText: 'Currency',
                  isMandatory: true,
                  items: currency,
                  displayValue: (item) => item,
                  controller: controller.currencyDropdownController,
                  prefixIcon: const Icon(Icons.currency_exchange_sharp),
                ),
                const SizedBox(height: 16),
                CustomInput(
                  labelText: 'Expected Revenue',
                  controller: controller.contactNumberController,
                  inputType: InputType.text,
                  isMandatory: true,
                  prefixIcon: const Icon(Icons.money),
                ),
                SizedBox(height: 16.0),
                CustomInput(
                  labelText: 'Expected closing Date',
                  hintText: 'Select Expected closing Date',
                  isMandatory: true,
                  controller: controller.DatePickercontroller,
                  inputType: InputType.date,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date for your event';
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    // color: theme.colorScheme.primary
                  ),
                ),
                SizedBox(height: 16.0),
                GenericDropdown<String>(
                  labelText: 'Account Name',
                  isMandatory: true,
                  items: accountName,
                  displayValue: (item) => item,
                  controller: controller.accountnameDropdownController,
                  prefixIcon: const Icon(Icons.account_circle),
                ),
                SizedBox(height: 16.0),
                GenericDropdown<String>(
                  labelText: 'Account Manager',
                  isMandatory: true,
                  items: accountManager,
                  displayValue: (item) => item,
                  controller: controller.accountmanagerDropdownController,
                  prefixIcon: const Icon(Icons.account_box),
                ),
                SizedBox(height: 16.0),
                GenericDropdown<String>(
                  labelText: 'Product Name',
                  isMandatory: true,
                  items: productName,
                  displayValue: (item) => item,
                  controller: controller.accountnameDropdownController,
                  prefixIcon: const Icon(Icons.production_quantity_limits),
                ),
                SizedBox(height: 16.0),
                CustomInput(
                  labelText: 'Product Description',
                  controller: controller.DealNameController,
                  inputType: InputType.text,
                  // isMandatory: true,
                  prefixIcon: const Icon(Icons.description),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
