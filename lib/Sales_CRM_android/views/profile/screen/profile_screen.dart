import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Profile",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Icon(
          IconlyLight.profile,
          size: 40,
        ),
      ],
    );
  }
}