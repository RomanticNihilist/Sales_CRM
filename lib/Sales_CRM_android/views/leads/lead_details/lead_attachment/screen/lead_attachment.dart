import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/lead_details/widget/custom_expansion_tile.dart';

class LeadAttachment extends StatelessWidget {
  const LeadAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        CustomExpansionTile(
            title: "Event",
            initiallyExpanded: true,
            showAddButton: true,
            children: [
              ListTile(
                title: Text("Event 1"),
                subtitle: Text("Event 1 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
            ],),
        CustomExpansionTile(
          title: "Contact",
          showAddButton: true,
          children: [
            ListTile(
              title: Text("Contact 1"),
              subtitle: Text("Contact 1 Description"),
            ),
            ListTile(
              title: Text("Contact 2"),
              subtitle: Text("Contact 2 Description"),
            ),
          ],
        ),
      ],
    ));
  }
}
