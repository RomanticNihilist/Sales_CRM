import 'package:flutter/material.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/forms/form_screen/event_management_form_widget.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/forms/form_screen/product_management_form_widget.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool initiallyExpanded;
  final List<Widget> children;
  final bool showAddButton;
  final Widget? modalWidget; // Accept modal widget as a parameter

  const CustomExpansionTile(
      {super.key,
      required this.title,
      this.initiallyExpanded = false,
      this.showAddButton = false,
      this.modalWidget,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showAddButton)
              IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  // print("try to console whats showing");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return modalWidget!;
                      });
                },
              ),
            Icon(
              Icons.expand_more,
            )
          ],
        ),
        // children: children,
        children: [
          // Wrap the children with a scrollable widget
          Container(
            constraints: BoxConstraints(maxHeight: 250), // Set max height
            child: SingleChildScrollView(
              // Allow scrolling when there are many items
              child: Column(
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
