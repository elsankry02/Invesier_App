import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/image_manger.dart';

class CircleAvatarWidget extends StatefulWidget {
  const CircleAvatarWidget({super.key});

  @override
  State<CircleAvatarWidget> createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> {
  File? file;
  // imagePickerGallery
  imageGallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageGallery == null) return;
    setState(() {
      file = File(imageGallery.path);
    });
  }

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
              onPressed: imageGallery,
              icon: Icon(color: ColorManger.kWhite, Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }
}
