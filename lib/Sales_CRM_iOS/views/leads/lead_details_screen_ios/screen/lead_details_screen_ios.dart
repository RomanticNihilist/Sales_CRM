import 'package:flutter/cupertino.dart';
import 'package:sale_crm/data/lead_data/converted_all_lead_data.dart';

class LeadDetailsScreenIos extends StatelessWidget {
  final Lead leadData;
  const LeadDetailsScreenIos({super.key, required this.leadData});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(leadData.organisationName),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        margin: EdgeInsets.only(top:60.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            
          border: Border(
            top: BorderSide(
              color: CupertinoColors.systemGrey5,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: CupertinoColors.systemGrey5,
              width: 1.0,
            ),
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lead Status: ${leadData.leadStatus}"),
            SizedBox(
              height: 8.0,
            ),
            Text("Sales Manager: ${leadData.salesManager}"),
            SizedBox(
              height: 8.0,
            ),
            Text(
                "Updated On: ${leadData.updatedOn.day}/${leadData.updatedOn.month}/${leadData.updatedOn.year}"),
          ],
        ),
      ),
    );
  }
}
