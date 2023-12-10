import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircleAvatar(
      radius: 55,
      foregroundImage: AssetImage(image),
    ));
  }
}
