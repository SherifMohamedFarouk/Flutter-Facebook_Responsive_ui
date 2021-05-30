import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:flutter_responsive_ui/widgets/profile_avatar.dart';

class UserCard extends StatelessWidget {
  final User currentUser;

  const UserCard({Key key, @required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: currentUser.imageUrl),
          const SizedBox(
            width: 6.0,
          ),
          Text(
            currentUser.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
