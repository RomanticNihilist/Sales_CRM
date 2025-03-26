import 'package:flutter/cupertino.dart';

import '../../../../../data/lead_data/converted_all_lead_data.dart';

class DetailsTabContent extends StatelessWidget {
  final Lead leadDetails;
  const DetailsTabContent({super.key, required this.leadDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListSection.insetGrouped(
          header: Text("LEAD INFORMATION"),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: [
            CupertinoListTile(
              leading: Icon(CupertinoIcons.building_2_fill),
              title: Text("Organisation Name"),
              subtitle: Text(leadDetails.organisationName),
            ),
            CupertinoListTile(
              leading: Icon(CupertinoIcons.bag),
              title: Text("Sector"),
              subtitle: Text(leadDetails.sector),
            ),
            CupertinoListTile(
              leading: Icon(CupertinoIcons.person_crop_circle),
              title: Text("Lead Status"),
              subtitle: Text(leadDetails.leadStatus),
            ),
            CupertinoListTile(
              leading: Icon(CupertinoIcons.group),
              title: Text("Employees"),
              subtitle: Text(leadDetails.noOfEmployees.toString()),
            ),
          ],
        ),
        CupertinoListSection.insetGrouped(
          header: Text("CONTACT INFORMATION"),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: [
            CupertinoListTile(
              leading: Icon(CupertinoIcons.building_2_fill),
              title: Text("Organisation Name"),
              subtitle: Text("John Doe"),
            ),
            CupertinoListTile(
              leading: Icon(CupertinoIcons.bag),
              title: Text("Sector"),
              subtitle: Text("+1 123 456 7890"),
            ),
            CupertinoListTile(
              leading: Icon(CupertinoIcons.person_crop_circle),
              title: Text("Status"),
              subtitle: Text(""),
            ),
          ],
        ),
      ],
    );
  }
}
