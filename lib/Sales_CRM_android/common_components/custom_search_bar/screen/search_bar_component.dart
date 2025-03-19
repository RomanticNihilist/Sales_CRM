import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarComponent({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search leads...',
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
