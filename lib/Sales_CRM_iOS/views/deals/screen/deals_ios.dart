import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../common_components_ios/list_view_for_screen/widget/list_view_screen_ios_.dart';
import '../controller/deal_screen_controller.dart';
import '../widget/deal_divider_ios.dart';
import '../widget/deal_header_ios.dart';

class DealsIos extends StatelessWidget {
  final AllDealsControllerIos _allDealsControllerIos =Get.put(AllDealsControllerIos());
   DealsIos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(
        //   middle: const Text('All Deals'),
        //   border: const Border(bottom: BorderSide(width: 0.0, color: CupertinoColors.systemGrey)),
        //   backgroundColor: CupertinoColors.systemGrey6,
        // ),
      child: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            AllDealsHeaderIos(),
            DealDividerIos(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _allDealsControllerIos.dealsList.length,
              itemBuilder: (context, index) {
                var deal = _allDealsControllerIos.dealsList[index];
                String formattedDate = DateFormat('dd/MM/yyyy').format(deal.updatedOn);
                return ListViewScreenIos(
                  title: deal.dealName,
                  status: deal.dealStatus,
                  updatedOn: formattedDate,
                  salesManager: deal.createdBy,
                  onTap: () => print("Tapped"),
                );
              },
            ),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     CupertinoButton(
        //         padding: EdgeInsets.zero,
        //         child: Icon(CupertinoIcons.sort_down),
        //         onPressed: () {}),
        //     Text("All Deals",
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        //     CupertinoButton(
        //         padding: EdgeInsets.zero,
        //         child: Text(""),
        //         onPressed: () {}),
        //   ],
        // ),
            ),
      ));
  }

  Widget _buildDivider() {
    return Container(
      height: 1.5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.sort_down),
            onPressed: () {},
          ),
          Text(
            "All Deals",
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
