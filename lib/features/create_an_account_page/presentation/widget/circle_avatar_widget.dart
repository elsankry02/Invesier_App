import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            child: Image.asset(height: 140, width: 140, ImageManger.kMintDark),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorManger.kTurquoiseBlue,
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(color: ColorManger.kWhite, Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }
}
