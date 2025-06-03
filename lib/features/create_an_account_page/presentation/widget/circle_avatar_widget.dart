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
  File? imagePicker;
  //! imagePickerGallery
  imageGallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imagePicker = File(imageGallery!.path);
    });
  }

  //! imagePickerCamera
  imageCamera() async {
    final imageCamera = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imagePicker = File(imageCamera!.path);
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
                imagePicker == null
                    ? Image.asset(
                      height: 140,
                      width: 140,
                      ImageManger.kMintDark,
                    )
                    : Image.file(imagePicker!),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorManger.kTurquoiseBlue,
            ),
            child: IconButton(
              onPressed: imageCamera,

              icon: Icon(color: ColorManger.kWhite, Icons.photo_camera),
            ),
          ),
        ],
      ),
    );
  }
}
