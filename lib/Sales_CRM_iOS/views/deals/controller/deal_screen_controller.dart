import 'package:get/get.dart';
import 'package:sale_crm/data/deal_data/all_deal_data.dart';
import 'package:sale_crm/data/deal_data/converted_all_deal_data.dart';

class AllDealsControllerIos extends GetxController {
  var dealsList = <Deal>[].obs;
  var sortBy = 'updatedOn'.obs;
  var sortByName = 'Updated On'.obs;

  @override
  void onInit() {
    super.onInit();
    dealsList.assignAll(allDealData.map((deal) => Deal.fromJson(deal)).toList());
    sortDeals();
  }

  /// Sort leads based on the selected attribute.
  void sortDeals() {
    if (sortBy.value == 'dealName') {
      dealsList.sort((a, b) => a.dealName.compareTo(b.dealName));
      sortByName.value = 'Deal Name';
    } else if (sortBy.value == 'dealStatus') {
      dealsList.sort((a, b) => a.dealStatus.compareTo(b.dealStatus));
      sortByName.value = 'Deal Status';
    } else if (sortBy.value == 'updatedOn') {
      // Sort by updated date descending so latest is on top.
      dealsList.sort((a, b) => b.updatedOn.compareTo(a.updatedOn));
      sortByName.value = 'Updated On';
    }
  }
}