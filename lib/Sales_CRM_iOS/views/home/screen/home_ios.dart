import 'package:flutter/cupertino.dart';

class HomeIos extends StatelessWidget {
const HomeIos({ super.key });

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(child: Center(child: Text("Home Screen")));
  }
}