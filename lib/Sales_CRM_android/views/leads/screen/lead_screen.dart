import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/floating_action_button/view/floating_action_button.dart';

class LeadScreen extends StatelessWidget{
  const LeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Leads",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Icon(
            IconlyLight.bookmark,
            size: 40,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonComponent(),
    );
  }
}