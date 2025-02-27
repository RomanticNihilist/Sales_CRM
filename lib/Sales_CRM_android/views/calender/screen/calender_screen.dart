import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CalenderScreen extends StatelessWidget{
  const CalenderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Calender",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Icon(
          IconlyLight.calendar,
          size: 40,
        ),
      ],
    );
  }
}
