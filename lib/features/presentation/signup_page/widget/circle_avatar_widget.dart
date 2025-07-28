import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';

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
                    ? Image.asset(AppImages.kMintDark, height: 140, width: 140)
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
              color: AppColors.kTurquoiseBlue,
            ),
            // IconButton (imageGallery)
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(color: AppColors.kWhite, Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }
}
