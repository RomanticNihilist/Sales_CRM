import 'package:flutter/cupertino.dart';
import 'package:sale_crm/data/lead_data/converted_all_lead_data.dart';

import '../../../../../components/top_tab_bar_view.dart';
import '../widget/details_tab_content.dart';

class LeadDetailsScreenIos extends StatelessWidget {
  final Lead leadData;
  const LeadDetailsScreenIos({super.key, required this.leadData});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(leadData.organisationName),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CupertinoListTile(
                    title: Text("Sales Manager"),
                    subtitle: Text(leadData.salesManager),
                    trailing: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey3,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(child: Text(leadData.salesManager.substring(0,1).toUpperCase())),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TabBarView(
                tabs: [
                  TabItem(name: 'Details', color: CupertinoColors.systemGrey),
                  TabItem(name: 'Related', color: CupertinoColors.systemGrey),
                ],
                onTabChanged: (index) {
                  switch(index){
                    case 0:
                      DetailsTabContent(leadDetails: leadData,);
                      break;
                    case 1:
                      print("Related");
                      break;
                  }
                },
              ),
            ),
            SizedBox(height: 10.0,),
            DetailsTabContent(leadDetails: leadData,),
          ],
        ),
      ),
    );
  }
}
