import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeadDetailsScreenIos extends StatelessWidget {
  final String email;
  const LeadDetailsScreenIos({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // padding: EdgeInsets.all(16.0),
        // height: MediaQuery.of(context).size.height * 0.2,
        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Madhurima Dey"),
            Text("Email : $email"),
          ],
        ),
      ),
    );
  }
}
