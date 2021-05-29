import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
 final List<IconData> icon ;
 final int selectedIndex ;
 final Function(int) onTap;

  const CustomTabBar({Key key,@required this.icon,@required this.selectedIndex,@required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
