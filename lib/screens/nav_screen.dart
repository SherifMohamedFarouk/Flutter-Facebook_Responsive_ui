import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/data/data.dart';
import 'package:flutter_responsive_ui/screens/home_screen.dart';
import 'package:flutter_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = <Widget>[
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData>_icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return DefaultTabController(length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)? PreferredSize(child:CustomAppBar(
               currentUser :currentUser,
              icon : _icons,
              selectedIndex : _selectedIndex,
              onTap: (index)=> setState(()=>_selectedIndex =index)

          ),
              preferredSize: Size(_screenSize.width,100)):null,
          body: IndexedStack(index:_selectedIndex,children:_screen,),
          bottomNavigationBar: !Responsive.isDesktop(context)? Container(
            child: Padding(padding: const EdgeInsets.only(bottom: 12.0),
              child: CustomTabBar(
                icon : _icons,
                selectedIndex : _selectedIndex,
                onTap: (index)=> setState(()=>_selectedIndex =index)
              ),
            ),
          ):const SizedBox.shrink(),
        )
    );
  }
}

