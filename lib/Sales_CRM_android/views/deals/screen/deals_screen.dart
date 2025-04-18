import 'package:chart_package/chart_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/Custom_card_leaddeals/controller/view/custom_card_leddeals.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/custom_card_view/screen/custom_card_view.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/custom_search_bar/screen/search_bar_component.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/floating_action_button/view/floating_action_button.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/controller/deals_controller.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/screen/deals_details_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/all_leads_screen/controller/lead_controller.dart';
import 'package:sale_crm/Sales_CRM_android/views/leads/lead_details/screen/lead_details_screen.dart';
import 'package:sale_crm/data/chart_data/deals_conversion_ratio_data/converted_deals_conversion_ratio_data.dart';
import 'package:sale_crm/data/chart_data/deals_conversion_ratio_data/deals_conversion_ratio_data.dart';

class DealsScreen extends StatelessWidget {
  final DealsController dealsController = Get.put(DealsController());
  final LeadController leadController = Get.put(LeadController());
  final dealConversionRatioData =
      DealConversionRatioData.fromRawData(rawDealConversionRateData);
  DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.72,
            right: MediaQuery.of(context).size.width * 0.01,
            child: FloatingActionButtonComponent(),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Text('Deals'),
      // ),
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  10, 10, 10, 0), // add right padding too
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // <-- like justify-content: space-between
                children: [
                  const Text(
                    'Deals Conversion Ratio',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // print("use for toggle");
                      dealsController.toggleSearchVisibility();
                    },
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: const [
            //         DealCard(title: 'Total No. of Deals', value: '202'),
            //         SizedBox(width: 12),
            //         DealCard(title: 'No. of Won Deals', value: '155'),
            //         SizedBox(width: 12),
            //         DealCard(title: 'No. of Active Deals', value: '48'),
            //         SizedBox(width: 12),
            //         DealCard(title: 'No. of Close Deals', value: '48'),
            //       ],
            //     ),
            //   ),
            // ),

            CustomCardView(
              height: 190,
              widget: ChartComponent(dealConversionRatioData.xData,
                  dealConversionRatioData.yData, true, true, ChartType.pie),
            ),
            if (dealsController.isSearchVisible.value)
              SizeTransition(
                sizeFactor: dealsController.animation,
                axisAlignment: -1.0,
                child: dealsController.isSearchVisible.value
                    ? SearchBarComponent(
                        onSearch: LeadController().filterLeads,
                        hintText: 'Search deals',
                      )
                    : const SizedBox(),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: leadController.filteredLeadsList.length,
                itemBuilder: (context, index) {
                  final lead = leadController.filteredLeadsList[index];
                  return Card(
                    child: ListTile(
                      title: Text(lead.organisationName),
                      subtitle: Text("Status: ${lead.leadStatus}"),
                      trailing: Text(
                        "${lead.updatedOn.day}/${lead.updatedOn.month}/${lead.updatedOn.year}",
                      ),
                      onTap: () {
                        Get.to(() => AllDealsDetails(lead: lead));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
