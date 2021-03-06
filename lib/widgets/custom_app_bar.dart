import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/config/palette.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:flutter_responsive_ui/widgets/custom_tab_bar.dart';
import 'package:flutter_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icon;

  final int selectedIndex;

  final Function(int) onTap;

  const CustomAppBar(
      {Key key,
        @required this.currentUser,
        @required this.icon,
        @required this.selectedIndex,
        @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4.0)
      ]),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.25,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(icon: icon,selectedIndex:selectedIndex ,onTap:onTap ,),
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               UserCard( currentUser : currentUser),
              const SizedBox(
                width: 12.0,
              ),
              CircleButton(
                iconSize: 30.0,
                onPressed: () {
                  print("search");
                },
                icons: MdiIcons.facebookMessenger,
              ),
              CircleButton(
                iconSize: 30.0,
                onPressed: () {
                  print("messenger");
                },
                icons: Icons.search,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
