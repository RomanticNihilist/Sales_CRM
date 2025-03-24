import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/lead_data/converted_all_lead_data.dart';
import '../controller/lead_details_controller.dart';
import '../lead_all_details/screen/lead_all_details.dart';

class AllLeadDetails extends StatelessWidget {
  final LeadDetailsController leadDetailsController = Get.put(LeadDetailsController());
  final Lead lead;
  AllLeadDetails({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lead.organisationName),
        bottom: TabBar(
          controller: leadDetailsController.tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.text_snippet_sharp),
              text: "Details",
            ),
            Tab(
              icon: Icon(Icons.attach_email_outlined),
              text: "Related",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: leadDetailsController.tabController,
        children: <Widget>[
          LeadDetailPage(
            lead: lead,
          ),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}
