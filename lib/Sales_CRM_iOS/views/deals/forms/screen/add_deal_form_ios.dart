import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/generic_dropdown/widget/generic_dropdown_ios.dart';
import 'package:sale_crm/components/custom_input_IOS.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/deals/forms/controller/add_deal_form_ios_controller.dart';
class AddDealFormIos extends StatelessWidget {
  const AddDealFormIos({super.key});

  @override
  Widget build(BuildContext context) {
    final AddDealFormControllerIos _addDealController =
    Get.put(AddDealFormControllerIos());
// Example lists for the dropdowns (can be fetched from an API or database)
    final currency = ['USD', 'GBP', 'INR', 'QAR','SAR','AED'];
    final accountName  = ['Shopanova', 'Gleeds', 'MTN', 'Dedalus','URC global','Keross holding'];
    final manager = ['Farouk said'];
    final product = ['HCM','CCC','ITSM','SSD','Sales CRM'];
    var isExpanded = false.obs; // Controls the "Show all fields" functionality

    void changeView() {
      isExpanded.value = !isExpanded.value;
    }

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text("Close"),
            onPressed: () {
              Get.back();
            }),
        middle: Text('Add Deal'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text('Save'),
          onPressed: () {
            _addDealController.saveDeal();
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header: Lead Information
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'LEAD INFORMATION',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Contact Information Section
              //_buildSectionHeader('Contact Information'),
              CustomInputIOS(
                hintText: 'Deal Number',
                isMandatory: true,
                controller: _addDealController.organizationNameController,
                prefixIcon: Icon(CupertinoIcons.building_2_fill),
              ),
              SizedBox(height: 16),
              CustomInputIOS(
                hintText: 'Deal Name',
                controller: _addDealController.emailController,
                inputType: InputType.text,
                prefixIcon: Icon(CupertinoIcons.mail),
              ),
              SizedBox(height: 16),
              CustomInputIOS(
                hintText: 'Expected revenue',
                controller: _addDealController.expectedRevenueController,
                inputType: InputType.number,
                prefixIcon: Icon(CupertinoIcons.money_dollar_circle),
              ),
              SizedBox(height: 16),
              CustomInputIOS(
                hintText: 'Expected Closing date',
                controller: _addDealController.numberOfEmployeesController,
                inputType: InputType.number,
                prefixIcon: Icon(CupertinoIcons.calendar),
              ),
              SizedBox(height: 16),

              Obx(() => isExpanded.value
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sector Dropdown
                  GenericDropdownIos<String>(
                    hintText: 'Select Currency',
                    labelText: 'Currency',
                    isMandatory: true,
                    items: currency,
                    displayValue: (item) => item,
                    controller:
                    _addDealController.currencyDropdownController,
                    prefixIcon: Icon(CupertinoIcons.money_dollar),
                  ),
                  SizedBox(height: 16),

                  // Source Dropdown
                  GenericDropdownIos<String>(
                    labelText: 'Account name',
                    hintText: 'Select account name',
                    items: accountName,
                    displayValue: (item) => item,
                    controller:
                    _addDealController.accountNameDropdownController,
                    prefixIcon: Icon(CupertinoIcons.person),
                  ),
                  SizedBox(height: 16),

                  // Website Field
                  GenericDropdownIos<String>(
                    labelText: 'Account manager name',
                    hintText: 'Select account manager',
                    items: manager,
                    displayValue: (item) => item,
                    controller:_addDealController.accountManagerDropdownController,
                    prefixIcon: Icon(CupertinoIcons.person),
                  ),
                  SizedBox(height: 20),

                  // Address Section (Initially hidden in Smart View)

                  GenericDropdownIos<String>(
                    labelText: 'Product name',
                    hintText: 'Select Product name',
                    items: product,
                    displayValue: (item) => item,
                    controller:_addDealController.productNameDropdownController,
                    prefixIcon: Icon(CupertinoIcons.person),
                  ),
                  SizedBox(height: 16),
                  CustomInputIOS(
                    hintText: 'Product Description',
                    controller: _addDealController.productDescriptionController,
                    prefixIcon: Icon(CupertinoIcons.placemark),
                  ),
                  SizedBox(height: 16),
                  // Country Dropdown
                ],
              )
                  : Container()),

              // Toggle "Show all fields" functionality
              SizedBox(height: 20),
              Obx(() {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      changeView();
                    },
                    child: Text(
                      isExpanded.value
                          ? 'Switch to Smart View'
                          : 'Show all fields',
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CupertinoColors.systemGrey,
        ),
      ),
    );
  }
}
