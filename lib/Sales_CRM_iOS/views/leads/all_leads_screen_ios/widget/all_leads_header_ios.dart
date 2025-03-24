import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/leads/all_leads_screen_ios/controller/all_leads_controller_ios.dart';

class AllLeadsHeaderIos extends StatelessWidget {
  AllLeadsHeaderIos({super.key});

  final GlobalKey buttonKey = GlobalKey();
  final AllLeadsControllerIos _allLeadsControllerIos = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Obx(() {
            return Row(
              children: [
                Icon(CupertinoIcons.sort_down),
                Text(_allLeadsControllerIos.sortByName.value, style: TextStyle(fontSize: 15.0),)
              ],
            );
          }),
          onPressed: () {
            // RenderBox renderBox =
            //     buttonKey.currentContext?.findRenderObject() as RenderBox;
            // var offset = renderBox.localToGlobal(Offset.zero);
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text("Sort By"),
                      content: Column(
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text("Organization Name"),
                            onPressed: () {
                              Get.back();
                              _allLeadsControllerIos.sortBy.value =
                                  "organisationName";
                              _allLeadsControllerIos.sortLeads();
                            },
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text("Status"),
                            onPressed: () {
                              Get.back();
                              _allLeadsControllerIos.sortBy.value =
                                  "leadStatus";
                              _allLeadsControllerIos.sortLeads();
                            },
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: Text("Updated On"),
                            onPressed: () {
                              Get.back();
                              _allLeadsControllerIos.sortBy.value = "updatedOn";
                              _allLeadsControllerIos.sortLeads();
                            },
                          ),
                        ],
                      ),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
          },
        ),
        Text(
          "All Leads",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(""),
          onPressed: () {},
        ),
      ],
    );
  }
}
