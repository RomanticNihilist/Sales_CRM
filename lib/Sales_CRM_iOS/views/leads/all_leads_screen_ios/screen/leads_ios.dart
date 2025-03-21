import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/leads/all_leads_screen_ios/controller/all_leads_controller_ios.dart';

import '../../../../../components/top_tab_bar_view.dart';
import '../../../../common_components_ios/list_view_for_screen/widget/list_view_screen_ios_.dart';
import '../../lead_details_screen_ios/screen/lead_details_screen_ios.dart';
import '../widget/all_leads_header_ios.dart';
import '../widget/lead_divider_ios.dart';

class LeadsIos extends StatelessWidget {
  final AllLeadsControllerIos allLeadsControllerIos =
      Get.put(AllLeadsControllerIos());
  LeadsIos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TabItem> tabs = [
      TabItem(name: 'Midnight', color: const Color(0xff191970)),
      TabItem(name: 'Viridian', color: const Color(0xff40826d)),
      TabItem(name: 'Cerulean', color: const Color(0xff007ba7)),
    ];

    return CupertinoPageScaffold(
        child: Column(
      children: [
        AllLeadsHeaderIos(),
        LeadDividerIos(),
        Obx(() {
          return Expanded(
            child: ListView.builder(
                itemCount: allLeadsControllerIos.leadsList.length,
                itemBuilder: (context, index) {
                  var lead = allLeadsControllerIos.leadsList[index];
                  return ListViewScreenIos(
                    title: lead.organisationName,
                    status: lead.leadStatus,
                    updatedOn:
                        "${lead.updatedOn.day}/${lead.updatedOn.month}/${lead.updatedOn.year}",
                    salesManager: lead.salesManager,
                    onTap:(){
                      Get.to(LeadDetailsScreenIos(
                        email: lead.email,
                      ));
                    }
                  );
                }),
          );
        })
      ],
    ));
  }
}

/**
 * Center(
        child: CupertinoButton(
          onPressed: () {
            // Navigate to TabBarView with dynamic tabs using GetX
            Get.to(
                  () => TabBarView(
                tabs: tabs,
                onTabChanged: (index) {
                  print('Selected Tab: ${tabs[index].name}');
                },
              ),
            );
          },
          child: const Text('Go to Tab View'),
        ),
      ), 
*/
