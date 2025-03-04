import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SalesCrmEntryPointIOS extends StatelessWidget {
const SalesCrmEntryPointIOS({ super.key });

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      child: AppBar(),
      );
  }

  
  // Widget _bottomAppBarItem(BuildContext context,
  //     {required icon, required page, required label}) {
  //   return ZoomTapAnimation(
  //     onTap: () => _salesCrmEntryPointAndroidController.goToTab(page),
  //     child: Container(
  //       color: Colors.transparent,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             icon,
  //             color: _salesCrmEntryPointAndroidController.currentPage == page
  //                 ? ColorConstants.appColors
  //                 : Colors.grey,
  //             size: 20,
  //           ),
  //           Text(
  //             label,
  //             style: TextStyle(
  //                 color: _salesCrmEntryPointAndroidController.currentPage == page
  //                     ? ColorConstants.appColors
  //                     : Colors.grey,
  //                 fontSize: 13,
  //                 fontWeight: _salesCrmEntryPointAndroidController.currentPage == page
  //                     ? FontWeight.w600
  //                     : null),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}