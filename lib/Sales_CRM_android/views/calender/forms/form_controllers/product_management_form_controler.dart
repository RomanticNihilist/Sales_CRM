import 'package:flutter/material.dart';
import 'package:sale_crm/components/generic_dropdown.dart';

class ProductFormController {
  GenericDropdownController<String> productnameDropdownController =
      GenericDropdownController<String>(displayValue: (item) => item);

  TextEditingController productDescriptionController = TextEditingController();
}
