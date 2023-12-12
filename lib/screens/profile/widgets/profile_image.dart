import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key, required this.image, required this.uploadImageFunc});
  final String image;
  final Function() uploadImageFunc;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 55,
            foregroundImage: NetworkImage(image),
          ),
          Positioned(
            top: 70,
            left: 70,
            child: ClipOval(
              child: Container(
                width: 40,
                height: 40,
                color: const Color(0xff62c1c7),
                child: IconButton(
                    onPressed: uploadImageFunc,
                    icon: const Icon(
                      Icons.upload,
                      color: Colors.white,
                      size: 22,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
