import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/floating_action_button/view/floating_action_button.dart';

class ContactScreen extends StatelessWidget{
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Contacts",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Icon(
            IconlyLight.calling,
            size: 40,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonComponent(),
    );
  }
}