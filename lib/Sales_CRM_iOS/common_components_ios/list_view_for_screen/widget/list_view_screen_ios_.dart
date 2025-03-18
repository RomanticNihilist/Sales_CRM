import 'package:flutter/cupertino.dart';

import '../../custom_card_view_ios/custom_card_view_ios.dart';

class ListViewScreenIos extends StatelessWidget {
  final String title;
  const ListViewScreenIos({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomCardViewIos(
      height: 90.0,
      padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
      widget: CupertinoListTile(
        title: Text(title,
            style: TextStyle(
                color: CupertinoColors.black, fontWeight: FontWeight.bold)),
        leading: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey4,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(child: Text('M')),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.globe,
                  color: CupertinoColors.black,
                  size: 16.0,
                ),
                SizedBox(width: 5),
                Text('SubTitle 1',
                    style: TextStyle(
                        color: CupertinoColors.black,
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.mail,
                  color: CupertinoColors.black,
                  size: 16.0,
                ),
                SizedBox(width: 5),
                Text('SubTitle 2',
                    style: TextStyle(
                        color: CupertinoColors.black,
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
          ],
        ),
        trailing:
            CupertinoButton(child: Icon(CupertinoIcons.mail), onPressed: () {}),
      ),
    );
  }
}
