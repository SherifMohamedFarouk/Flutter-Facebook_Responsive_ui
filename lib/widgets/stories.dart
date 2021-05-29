import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_responsive_ui/widgets/profile_avatar.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({Key key, @required this.currentUser, this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(isAddStory: true, currentUser: currentUser),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: stories[index - 1],
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard(
      {Key key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => print("Story added"),
                      iconSize: 30.0,
                      padding: EdgeInsets.zero,
                    ))
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,isBorder:!story.isViewed,
                  )),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? "Add to Story" : story.user.name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
