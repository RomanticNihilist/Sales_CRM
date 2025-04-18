import 'package:flutter/material.dart';

class DealsPricing extends StatefulWidget {
  @override
  _DealsPricingState createState() => _DealsPricingState();
}

class _DealsPricingState extends State<DealsPricing> {
  // License data
  final List<Map<String, String>> licenseData = [
    {
      'licenseType': 'Admin User',
      'costPerLicense': '95.00',
      'contractDuration': 'Monthly',
      'licenseStartDate': '26-03-2025',
      'licenseEndDate': '25-04-2025',
      'noOfLicense': '1.00',
      'billingAmount': '95.00',
    },
    // Add other licenses if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing Details'),
      ),
      body: ListView.builder(
        itemCount: licenseData.length,
        itemBuilder: (context, index) {
          return LicenseExpansionTile(
            licenseData: licenseData[index],
          );
        },
      ),
    );
  }
}

class LicenseExpansionTile extends StatefulWidget {
  final Map<String, String> licenseData;

  const LicenseExpansionTile({Key? key, required this.licenseData})
      : super(key: key);

  @override
  _LicenseExpansionTileState createState() => _LicenseExpansionTileState();
}

class _LicenseExpansionTileState extends State<LicenseExpansionTile> {
  bool _isExpanded = false; // To track expansion state

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Always visible fields with bold and larger field names
          _buildField('License Type', widget.licenseData['licenseType']!),
          _buildField('Cost/License/Month (USD)',
              widget.licenseData['costPerLicense']!),
          _buildField(
              'Contract Duration', widget.licenseData['contractDuration']!),
          _buildField(
              'License Start Date', widget.licenseData['licenseStartDate']!),
          _buildField(
              'License End Date', widget.licenseData['licenseEndDate']!),

          // Expandable section only for Admin User
          widget.licenseData['licenseType'] == 'Admin User'
              ? ExpansionTile(
                  title: Text(
                    'Admin User',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.black,
                  ),
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      _isExpanded = expanded;
                    });
                  },
                  children: [
                    _buildField(
                        'No. of License', widget.licenseData['noOfLicense']!),
                    _buildField('Billing Amount (USD)',
                        widget.licenseData['billingAmount']!),
                  ],
                )
              : Container(), // For non-Admin User, no expandable section
        ],
      ),
    );
  }

  // Helper function to build a field with a larger field name and smaller details
  Widget _buildField(String fieldName, String fieldDetail) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Field Name with larger font size
          Text(
            '$fieldName:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16, // Larger font size for field name
            ),
          ),
          // Field Detail with smaller font size
          Text(
            fieldDetail,
            style: TextStyle(
              fontSize: 14, // Smaller font size for field detail
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
