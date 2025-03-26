import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final bool initiallyExpanded;
  final List<Widget> children;
  final bool showAddButton;
  const CustomExpansionTile(
      {super.key,
      required this.title,
      this.initiallyExpanded = false,
      this.showAddButton = false,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
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
                onPressed: () {},
              ),
            Icon(
              Icons.expand_more,
            )
          ],
        ),
        children: children,
      ),
    );
  }
}
