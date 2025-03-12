import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/components/custom_input.dart';
import 'package:sale_crm/components/generic_dropdown.dart';
import '../forms_controller/add_lead_form_controller.dart';

class AddLeadFormScreen extends StatelessWidget {
  const AddLeadFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeadFormController()); // GetX controller instance

    // Example lists for the dropdowns (can be fetched from an API or database)
    final sectors = ['Technology', 'Finance', 'Healthcare', 'Education'];
    final sources = ['Web', 'Referral', 'Ad Campaign', 'Direct'];
    final countries = ['USA', 'Canada', 'India', 'Germany'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Lead'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Save logic or validation
              controller.saveLead();
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
              // Header: Lead Information
              Text(
                'LEAD INFORMATION',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),

              // Contact Information Section
              _buildSectionHeader('Contact Information'),
              CustomInput(
                labelText: 'Organization Name',
                isMandatory: true,
                controller: controller.organizationNameController,
                prefixIcon: Icon(Icons.business),
              ),
              SizedBox(height: 16),
              CustomInput(
                labelText: 'Email',
                controller: controller.emailController,
                inputType: InputType.text,
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 16),
              CustomInput(
                labelText: 'Contact Number',
                controller: controller.contactNumberController,
                inputType: InputType.number,
                prefixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 16),
              CustomInput(
                labelText: 'Number of Employees',
                controller: controller.numberOfEmployeesController,
                inputType: InputType.number,
                prefixIcon: Icon(Icons.group),
              ),
              SizedBox(height: 16),

              Obx(() => controller.isExpanded.value
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sector Dropdown
                  GenericDropdown<String>(
                    labelText: 'Sector',
                    isMandatory: true,
                    items: sectors,
                    displayValue: (item) => item,
                    controller: controller.sectorDropdownController,
                    prefixIcon: Icon(Icons.business_center),
                  ),
                  SizedBox(height: 16),

                  // Source Dropdown
                  GenericDropdown<String>(
                    labelText: 'Source',
                    items: sources,
                    displayValue: (item) => item,
                    controller: controller.sourceDropdownController,
                    prefixIcon: Icon(Icons.source),
                  ),
                  SizedBox(height: 16),

                  // Website Field
                  CustomInput(
                    labelText: 'Website',
                    controller: controller.websiteController,
                    prefixIcon: Icon(Icons.web),
                  ),
                  SizedBox(height: 20),

                  // Address Section
                  _buildSectionHeader('Address'),
                  CustomInput(
                    labelText: 'Street',
                    controller: controller.streetController,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    labelText: 'City',
                    controller: controller.cityController,
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    labelText: 'State',
                    controller: controller.stateController,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    labelText: 'ZIP/Postal Code',
                    controller: controller.zipCodeController,
                    prefixIcon: Icon(Icons.pin_drop),
                  ),
                  SizedBox(height: 16),
                  // Country Dropdown
                  GenericDropdown<String>(
                    labelText: 'Country',
                    items: countries,
                    displayValue: (item) => item,
                    controller: controller.countryDropdownController,
                    prefixIcon: Icon(Icons.flag),
                  ),
                  SizedBox(height: 16),
                ],
              )
                  : Container()),

              // Toggle "Show all fields" functionality
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    controller.toggleExpanded();
                  },
                  child: Obx(() => Text(
                    controller.isExpanded.value
                        ? 'Switch to Smart View'
                        : 'Show all fields',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
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
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
