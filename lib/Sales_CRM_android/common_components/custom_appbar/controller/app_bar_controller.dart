import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/sales_crm_entry_point_android/controller/sales_crm_entry_point_android_controller.dart';

class AppBarController extends GetxController {
  final SalesCrmEntryPointAndroidController salesCrmEntryPointAndroidController = Get.find<SalesCrmEntryPointAndroidController>();
  RxInt get currentPage => salesCrmEntryPointAndroidController.currentPage;
  String getAppBarTitle(){
    switch(currentPage.value){
      case 0:
        return "Calender";
      case 1:
        return "Home";
      case 2:
        return "Leads";
      case 3:
        return "Contacts";
      case 4:
        return "Profile";
      default:
        return "Sales CRM";
    }
  }
}
