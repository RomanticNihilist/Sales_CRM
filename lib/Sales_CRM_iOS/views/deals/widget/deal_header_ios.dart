import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/deals/controller/deal_screen_controller.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/deals/controller/deal_screen_controller.dart';

class AllDealsHeaderIos extends StatelessWidget {
  AllDealsHeaderIos({super.key});

  final GlobalKey buttonKey = GlobalKey();
  final AllDealsControllerIos _allDealsControllerIos = Get.find();

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
                Text(_allDealsControllerIos.sortByName.value, style: TextStyle(fontSize: 15.0),)
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
                        child: Text("Deal Name"),
                        onPressed: () {
                          Get.back();
                          _allDealsControllerIos.sortBy.value =
                          "dealName";
                          _allDealsControllerIos.sortDeals();
                        },
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text("Deal Status"),
                        onPressed: () {
                          Get.back();
                          _allDealsControllerIos.sortBy.value =
                          "dealStatus";
                          _allDealsControllerIos.sortDeals();
                        },
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text("Updated On"),
                        onPressed: () {
                          Get.back();
                          _allDealsControllerIos.sortBy.value = "updatedOn";
                          _allDealsControllerIos.sortDeals();
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
