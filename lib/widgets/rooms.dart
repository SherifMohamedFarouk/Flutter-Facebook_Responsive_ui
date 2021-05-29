import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/config/palette.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:flutter_responsive_ui/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: ListView.builder(
        itemCount: 1 + onlineUsers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(imageUrl: onlineUsers[index - 1].imageUrl,isActive: true,));
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("Create rooom"),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(width: 3, color: Colors.blueAccent[100]),
      ),
      child: Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (bounds) =>
          //       Palette.createRoomGradient.createShader(bounds),
          //   child: Icon(
          //     Icons.video_call,
          //     color: Colors.white,
          //     size: 35.0,
          //   ),
          // ),
           Icon(
            Icons.video_call,
            color: Colors.purple,
            size: 35.0,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text("Create\nRoom"),
        ],
      ),
    );
  }
}
