import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/lead_details/widget/custom_expansion_tile.dart';

class LeadAttachment extends StatelessWidget {
  const LeadAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
          child: Column(
        children: [
          CustomExpansionTile(
            title: "Event",
            initiallyExpanded: true,
            // showAddButton: true,
            children: [
              ListTile(
                title: Text("Event 1"),
                subtitle: Text("Event 1 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
            ],
          ),
          CustomExpansionTile(
            title: "Contact",
            // showAddButton: true,
            children: [
              ListTile(
                title: Text("Contact 1"),
                subtitle: Text("Contact 1 Description"),
              ),
              ListTile(
                title: Text("Contact 2"),
                subtitle: Text("Contact 2 Description"),
              ),
            ],
          ),
          CustomExpansionTile(
            title: "Product Details",
            children: [
              _buildDetailRow(Icons.production_quantity_limits_outlined,
                  "Product Name", "professional service"),
              _buildDetailRow(Icons.text_snippet_sharp, "Product Description",
                  "This product for professional service"),
            ],
          ),
          CustomExpansionTile(
            title: "Point of interest",
            children: [
              ListTile(
                title: Text("Description"),
                subtitle: Text("Discovering"),
              ),
              ListTile(
                title: Text("Updated by"),
                subtitle: Text("Madhurima dey"),
              ),
              ListTile(
                title: Text("Updated on"),
                subtitle: Text("28-Feb-2024"),
              ),
              // _buildDetailRow(Icons.production_quantity_limits_outlined,
              //     "Product Name", "professional service"),
              // _buildDetailRow(Icons.text_snippet_sharp, "Product Description",
              //     "This product for professional service"),
            ],
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Write your Notes',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    // controller: _controller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Notes here...',
                    ),
                  ),
                  SizedBox(height: 12.0),
                  ElevatedButton(
                    onPressed: () {
                      // String description = ;
                      // print('Description: $description');
                      // Add functionality to save or use the description as needed
                    },
                    child: Text('Save Notes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 26),
          const SizedBox(width: 16),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "$title: ",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return ListTile(
    //   leading: Icon(icon, color: Colors.blueAccent, size: 26),
    //   title: Text(
    //     title,
    //     style: const TextStyle(
    //       fontSize: 16,
    //       fontWeight: FontWeight.w600,
    //       color: Colors.black87,
    //     ),
    //   ),
    //   subtitle: Text(value),
    // );
  }
}
