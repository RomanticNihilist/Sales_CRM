import 'package:flutter/cupertino.dart';

class CustomCardViewIos extends StatelessWidget {
  final Widget widget;
  final double height;
  final EdgeInsets padding;
  const CustomCardViewIos ({super.key, required this.widget, this.height = 300, this.padding = const EdgeInsets.all(16.0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: double.infinity,
      height: height, // Adjust the height as needed
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 4,
          ),
        ],
      ),
      padding: padding,
      child: widget,
    );
  }
}
