import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Home",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Icon(
          IconlyLight.home,
          size: 40,
        ),
      ],
    );
  }
}