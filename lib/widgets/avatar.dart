import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart/colors.dart';
import '../models/user_model.dart';

class AvatarImage extends StatelessWidget {
  final String uid;
  final double radius;
  const AvatarImage({
    required this.uid,
    this.radius = 50,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
        stream: UserModel.fromUidStream(uid: uid),
        builder: (context, AsyncSnapshot<UserModel?> snap) {
          if (snap.error != null || !snap.hasData) {
            return tempProfile(context);
          } else {
            if (snap.data!.profileImg.isEmpty) {
              return tempProfile(context);
            } else if (snap.connectionState == ConnectionState.waiting) {
              return tempProfile(context);
            } else {
              return FittedBox(
                child: CircleAvatar(
                  radius: radius,
                  backgroundImage: CachedNetworkImageProvider(
                    snap.data!.profileImg,
                    cacheKey: snap.data!.profileImg,
                  ),
                ),
              );
            }
          }
        });
  }

  Widget tempProfile(BuildContext context) {
    return FittedBox(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: kcPrimaryColor,
        child: Icon(
          Icons.add,
          size: radius * 0.6,
        ),
      ),
    );
  }
}
