import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_responsive_ui/widgets/profile_avatar.dart';

class CreatPostContainer extends StatelessWidget {
  final User currentUser;

  const CreatPostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0,),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What is in your mind ?"),
                ),
              ),
            ],

          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: () {
                 print("Live");
                } , icon: Icon(Icons.videocam,color: Colors.red,), label: Text("Live",style: TextStyle(color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),),
                const VerticalDivider(width: 8.0,),
                ElevatedButton.icon(onPressed: () {
                  print("Photos");
                }, icon: Icon(Icons.photo_library,color: Colors.green,), label: Text("Photos",style: TextStyle(color: Colors.black)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),),
                const VerticalDivider(width: 8.0,),
                ElevatedButton.icon(onPressed: () {
                  print("Room");
                }, icon: Icon(Icons.video_call,color: Colors.purpleAccent,), label: Text("Room",style: TextStyle(color: Colors.black)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                )
              ],
            ),
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
