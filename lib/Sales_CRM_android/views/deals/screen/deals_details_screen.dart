import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/controller/deals_details_controller.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/screen/deals_all_details.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/screen/deals_attachment.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/lead_details/controller/lead_details_controller.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/lead_details/lead_attachment/screen/lead_attachment.dart';

import '../../../../../data/lead_data/converted_all_lead_data.dart';

class AllDealsDetails extends StatelessWidget {
  final DealsDetailsController dealsDetailsController =
      Get.put(DealsDetailsController());
  final Lead lead;
  AllDealsDetails({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lead.organisationName),
        bottom: TabBar(
          controller: dealsDetailsController.tabController,
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
          controller: dealsDetailsController.tabController,
          children: <Widget>[
            DealDetailPage(
              lead: lead,
            ),
            DealAttachment(),
          ]),
    );
  }
}
