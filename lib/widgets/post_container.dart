import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/config/palette.dart';
import 'package:flutter_responsive_ui/models/models.dart';
import 'package:flutter_responsive_ui/widgets/profile_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post posts;

  const PostContainer({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: posts),
                const SizedBox(
                  height: 4.0,
                ),
                Text(posts.caption),
                posts.imageUrl != null
                    ? const SizedBox(
                        height: 4.0,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          posts.imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: posts.imageUrl,
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 4.0,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostState(post: posts,)
          ),

          const Divider(
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PostButton(iconData: MdiIcons.thumbUpOutline, label: "Likes", onTap: (){print("likes added");}),
              _PostButton(iconData: MdiIcons.commentOutline, label: "Comment", onTap: (){print("Comment added");}),
              _PostButton(iconData: MdiIcons.shareOutline, label: "Share", onTap: (){print("Share added");})
            ],
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} .",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () => print("more settings"),
        )
      ],
    );
  }
}

class _PostState extends StatelessWidget {
  final Post post;

  const _PostState({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10.0,
              ),

            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
               " ${post.likes}",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
            ),

            const SizedBox(
              width: 4.0,
            ),
            Text(
              " ${post.comments} Comments",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              " ${post.shares} Shares",style: TextStyle(fontSize: 12.0,color: Colors.grey),),

          ],
        ),
       
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final IconData iconData ;
  final String label;
  final Function onTap;
  const _PostButton({Key key,@required this.iconData,@required this.label,@required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 25.0,
          child: Row(
            children: [
              Icon(iconData,color: Colors.black,),
              const SizedBox(width: 4.0,),
              Text(label)

            ],
          ),
        ),
      ),
    );
  }
}

