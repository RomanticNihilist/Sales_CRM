import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/forms/form_controllers/product_management_form_controler.dart';
import 'package:sale_crm/components/custom_input.dart';
import 'package:sale_crm/components/generic_dropdown.dart';

import '../form_controllers/event_management_form_controller.dart';

class ProductManagementFormWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _eventTitleController = TextEditingController();
  // final TextEditingController _meetingLinkController = TextEditingController();

  final controller = Get.put(ProductFormController());

  final productName = [
    "Professional Service",
    "User License",
    "Service level Agreement  ",
    "Test App",
    "Supplier management",
    "Hcm",
    "Ssd"
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.put(ProductFormController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        insetPadding: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Product',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  GenericDropdown<String>(
                    labelText: 'Product Name',
                    isMandatory: true,
                    items: productName,
                    displayValue: (item) => item,
                    controller: controller.productnameDropdownController,
                    prefixIcon: const Icon(Icons.production_quantity_limits),
                  ),
                  SizedBox(height: 16.0),
                  CustomInput(
                    labelText: 'Product Description',
                    controller: controller.productDescriptionController,
                    inputType: InputType.text,
                    // isMandatory: true,
                    prefixIcon: const Icon(Icons.description),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
