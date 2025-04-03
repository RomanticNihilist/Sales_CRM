import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final Function(String) onSearch;

  final String hintText;

  const SearchBarComponent(
      {super.key, required this.onSearch, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (query) {
          onSearch(query);
        },
      ),
    );
  }
}
