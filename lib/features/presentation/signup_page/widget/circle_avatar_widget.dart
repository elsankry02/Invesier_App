import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/image_manger.dart';

class CircleAvatarWidget extends StatelessWidget {
  final File? file;
  final void Function()? onPressed;
  const CircleAvatarWidget({super.key, this.file, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            child:
                file == null
                    ? Image.asset(
                      ImageManger.kMintDark,
                      height: 140,
                      width: 140,
                    )
                    : Image.file(
                      file!,
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorManger.kTurquoiseBlue,
            ),
            // IconButton (imageGallery)
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
