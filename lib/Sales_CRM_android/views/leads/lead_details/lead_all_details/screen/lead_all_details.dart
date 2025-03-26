import 'package:flutter/material.dart';
import '../../../../../../data/lead_data/converted_all_lead_data.dart';
import '../../widget/custom_expansion_tile.dart';

class LeadDetailPage extends StatelessWidget {
  final Lead lead;
  const LeadDetailPage({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _cardView(),
              CustomExpansionTile(
                title:"Organisation Details",
                initiallyExpanded: true,
                children:[
                  _buildDetailRow(
                      Icons.business, "Organisation", lead.organisationName),
                  _buildDetailRow(Icons.work, "Sector", lead.sector),
                  _buildDetailRow(
                      Icons.track_changes, "Status", lead.leadStatus),
                  _buildDetailRow(Icons.group, "Employees",
                      lead.noOfEmployees?.toString() ?? 'N/A'),
                ],
              ),
              const SizedBox(height: 20),
              CustomExpansionTile(
                title: "Contact Information",
                children : [
                  _buildDetailRow(Icons.email, "Email", lead.email),
                  _buildDetailRow(Icons.phone, "Contact", lead.orgContactNo),
                  _buildDetailRow(
                      Icons.person, "Sales Manager", lead.salesManager),
                  _buildDetailRow(Icons.calendar_today, "Updated On",
                      lead.updatedOn.toLocal().toString()),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildExpandableSection(String title, List<Widget> children,
      {bool initiallyExpanded = false}) {
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
        children: children,
      ),
    );
  }

  Widget _cardView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildExpandableSection(
        //   "Organisation Details",
        //   [
        Text("LEAD INFORMATION",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent)),
        Card(
          child: Column(
            children: [
              _buildDetailRow(
                  Icons.business, "Organisation", lead.organisationName),
              _buildDetailRow(Icons.work, "Sector", lead.sector),
              _buildDetailRow(Icons.track_changes, "Status", lead.leadStatus),
              _buildDetailRow(Icons.group, "Employees",
                  lead.noOfEmployees?.toString() ?? 'N/A'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text("CONTACT INFORMATION",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent)),
        Card(
          child: Column(
            children: [
              _buildDetailRow(Icons.email, "Email", lead.email),
              _buildDetailRow(Icons.phone, "Contact", lead.orgContactNo),
              _buildDetailRow(Icons.person, "Sales Manager", lead.salesManager),
              _buildDetailRow(Icons.calendar_today, "Updated On",
                  lead.updatedOn.toLocal().toString()),
            ],
          ),
        ),

        //   ],
        //   initiallyExpanded: true,
        // ),
        // const SizedBox(height: 8),
        // _buildExpandableSection(
        //   "Additional Information",
        //   [

        //   ],
        // ),
        // const SizedBox(height: 8),
        // _buildExpandableSection(
        //   "Sales Information",
        //   [

        //   ],
        // ),
      ],
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
