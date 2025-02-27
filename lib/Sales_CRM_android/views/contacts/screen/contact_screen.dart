import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ContactScreen extends StatelessWidget{
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}