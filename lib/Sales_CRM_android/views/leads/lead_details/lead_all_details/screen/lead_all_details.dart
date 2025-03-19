import 'package:flutter/material.dart';
import '../../../../../../data/lead_data/converted_all_lead_data.dart';


class LeadDetailPage extends StatelessWidget {
  final Lead lead;
  const LeadDetailPage({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10,
            color: Colors.black.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 10
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(Icons.business, "Organisation", lead.organisationName),
                  _buildDetailRow(Icons.email, "Email", lead.email),
                  _buildDetailRow(Icons.phone, "Contact", lead.orgContactNo),
                  _buildDetailRow(Icons.group, "Employees", lead.noOfEmployees?.toString() ?? 'N/A'),
                  _buildDetailRow(Icons.work, "Sector", lead.sector),
                  _buildDetailRow(Icons.track_changes, "Status", lead.leadStatus),
                  _buildDetailRow(Icons.person, "Sales Manager", lead.salesManager),
                  _buildDetailRow(Icons.calendar_today, "Updated On", lead.updatedOn.toLocal().toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 26), // Subtle color
          const SizedBox(width: 16),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "$title: ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white70, // Slight contrast for details
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
}
