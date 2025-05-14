import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/forms/form_screen/event_management_form_widget.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/forms/form_screen/product_management_form_widget.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/Note.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/controller/Notes_controller.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/controller/deals_details_professional_service_controller.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/screen/deals_pricing.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/screen/deals_product_proffesionalservice_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/lead_details/widget/custom_expansion_tile.dart';

class DealAttachment extends StatelessWidget {
  const DealAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Note> notes = [
      Note(title: 'Note 1', description: 'This is the first note description'),
      Note(title: 'Note 2', description: 'This is the second note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
      Note(title: 'Note 3', description: 'This is the third note description'),
    ];

    final notesControler =
        Get.put(NotesController()); // Initialize the controller

    //for testing array data how to print in expansion tile
    // final List<String> items =
    //     List.generate(40, (index) => 'Item ${index + 1}');

    void showNoteInputBox(BuildContext context) {
      Get.bottomSheet(
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment
                .center, // Centers the content in the middle of the screen
            child: Container(
              height: 300, // Specify height for the container in the middle
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5), // Shadow for depth
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Ensures the sheet adjusts to the content size
                children: [
                  Text(
                    'Write your Notes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  // TextField bound to the controller's noteText observable
                  TextField(
                    controller: notesControler
                        .notesTakingcontroler, // Use TextEditingController here
                    maxLines: 5,
                    onChanged: (value) {
                      // Update the note text reactively (this is now unnecessary if you use noteText directly)
                      notesControler.noteText.value = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write your note here...',
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),

                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      notesControler.saveNote(); // Save the note
                      Get.back(); // Close the bottom sheet after saving
                      notesControler.clearNote();
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue, // Button color
                    ),
                    child: Text('Save Notes', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
        isScrollControlled:
            true, // Makes the bottom sheet size responsive to content
        backgroundColor: Colors.transparent, // Makes the background transparent
      );
    }

    return SingleChildScrollView(
      child: Expanded(
          child: Column(
        children: [
          CustomExpansionTile(
            title: "Events",
            initiallyExpanded: true,
            showAddButton: true,
            modalWidget: EventFormModal(), // Pass the modal widget directly

            children: [
              ListTile(
                title: Text("Event 1"),
                subtitle: Text("Event 1 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
              ListTile(
                title: Text("Event 2"),
                subtitle: Text("Event 2 Description"),
              ),
            ],

            // children: items.map((item) => Text(item)).toList(),
          ),
          CustomExpansionTile(
            title: "Contacts",
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
            title: "Products",
            showAddButton: true,
            modalWidget:
                ProductManagementFormWidget(), // Pass EventFormModal here
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: ProductCard(
                  'Professional Service',
                  'This product is for professional service',
                  '95.00 USD',
                  'John Doe',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: ProductCard(
                  'Professional Service',
                  'This product is for professional service',
                  '95.00 USD',
                  'John Doe',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: ProductCard(
                  'Professional Service',
                  'This product is for professional service',
                  '95.00 USD',
                  'John Doe',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3),
                child: ProductCard(
                  'Professional Service',
                  'This product is for professional service',
                  '95.00 USD',
                  'John Doe',
                ),
              ),
              // _buildDetailRow(Icons.production_quantity_limits_outlined,
              //     "Product Name", "professional service"),
              // _buildDetailRow(Icons.text_snippet_sharp, "Product Description",
              //     "This product for professional service"),
            ],
          ),
          Container(
            width: double.infinity, // Ensures the Card takes 100% width
            child: Card(
              margin: EdgeInsets.all(7),
              // elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Notes',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        showNoteInputBox(
                            context); // Show the input box when the icon is clicked
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            // elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "All Notes",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: notes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return Card(
                          margin: EdgeInsets.all(7),
                          // elevation: 5,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(5),
                            title: Text(note.title,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(note.description),
                            leading: Icon(Icons.note),
                            // trailing: Icon(Icons.arrow_forward),
                            onTap: () {
                              // Handle note tap
                            },
                          ),
                        );
                      },
                    ),
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
  }

  // Widget ProductCard(final String productName, final String description,
  //     final String billingAmount, final String projectManagerName) {
  //   return Card(
  //     // elevation: 0.5,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Product Name: $productName',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(height: 8),
  //           Text(
  //             'Description: $description',
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           SizedBox(height: 8),
  //           Text(
  //             'Billing Amount: $billingAmount',
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           SizedBox(height: 8),
  //           Text(
  //             'Project Manager: $projectManagerName',
  //             style: TextStyle(fontSize: 16),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget ProductCard(
    final String productName,
    final String description,
    final String billingAmount,
    final String projectManagerName,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product details page with the product data using Get.to()
        Get.to(
          // DealsPricing(),
          DealDetailsProfessionalScreen(),
          binding: DealDetailsBinding(), // IMPORTANT: Apply binding

          arguments: {
            'productName': productName,
            'description': description,
            'billingAmount': billingAmount,
            'projectManagerName': projectManagerName,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name: $productName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Description: $description',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Billing Amount: $billingAmount',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Project Manager: $projectManagerName',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
