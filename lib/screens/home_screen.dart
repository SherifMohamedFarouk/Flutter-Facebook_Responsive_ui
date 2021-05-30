import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/config/palette.dart';
import 'package:flutter_responsive_ui/data/data.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:flutter_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body:Responsive(mobile:_HomeScreenMobile(),
          desktop:_HomeScreenDesktop() ,)

      ),
    );
  }
}
class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.25,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
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
        ),
        SliverToBoxAdapter(
            child: CreatPostContainer(currentUser: currentUser
            )
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) {
            final Post post = posts[index];
            return PostContainer(posts: post);
          },
          childCount: posts.length,
        ))
      ],
    );
  }
}
class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


