import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GenericDropdownControllerIos<T> extends ChangeNotifier {
  Rx<T?> selectedValue = Rx<T?>(null); // For single selection
  RxList<T> selectedValues = RxList([]); // For multiple selection
  RxString searchText = ''.obs; // Search text
  final TextEditingController textController = TextEditingController();

  final String Function(T) displayValue;

  GenericDropdownControllerIos({
    T? initialSelectedValue,
    List<T>? initialSelectedValues,
    required this.displayValue,
  }) {
    if (initialSelectedValue != null) {
      selectedValue.value = initialSelectedValue;
    }
    if (initialSelectedValues != null) {
      selectedValues.addAll(initialSelectedValues);
    }
    _updateText();
  }

  void updateSearchText(String text) {
    searchText.value = text;
    notifyListeners();
  }

  void updateSelectedValue(T? value) {
    selectedValue.value = value;
    _updateText();
    notifyListeners();
  }

  void updateSelectedValues(List<T> values) {
    selectedValues.value = values;
    _updateText();
    notifyListeners();
  }

  void _updateText() {
    if (selectedValue.value != null) {
      textController.text = displayValue(selectedValue.value!);
    } else if (selectedValues.isNotEmpty) {
      textController.text = selectedValues.map(displayValue).join(', ');
    } else {
      textController.text = '';
    }
  }
}