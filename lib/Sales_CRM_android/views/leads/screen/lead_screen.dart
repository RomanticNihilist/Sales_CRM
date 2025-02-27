import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LeadScreen extends StatelessWidget{
  const LeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}