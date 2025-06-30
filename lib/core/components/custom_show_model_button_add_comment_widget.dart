import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invesier/core/components/custom_button_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class CustomShowModelButtonAddCommentWidget extends StatefulWidget {
  const CustomShowModelButtonAddCommentWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.titleButton,
    required this.vertical,
    required this.radius,
  });
  final String title;
  final String hintText;
  final String titleButton;
  final double vertical;
  final double radius;
  @override
  State<CustomShowModelButtonAddCommentWidget> createState() =>
      _CustomShowModelButtonAddCommentWidgetState();
}

class _CustomShowModelButtonAddCommentWidgetState
    extends State<CustomShowModelButtonAddCommentWidget> {
  File? file;
  final commentController = TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  imageGallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageGallery == null) return;

    setState(() {
      file = File(imageGallery.path);
    });
  }

  imagecamera() async {
    final imagecamera = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imagecamera == null) return;

    setState(() {
      file = File(imagecamera.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 10, start: 20, end: 20),
      width: context.width,
      decoration: BoxDecoration(
        color: ColorManger.kCodGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //! kArrow
              SvgPicture.asset(SvgManger.kArrow),
              SizedBox(height: context.height * 0.004),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! titel
                  Text(
                    widget.title,
                    style: context.kTextTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  //! icon
                  IconButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    icon: Icon(FontAwesomeIcons.xmark),
                  ),
                ],
              ),
              //! TextFormField
              TextFormField(
                cursorColor: ColorManger.kWhite,
                controller: commentController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: ColorManger.kGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),

              SizedBox(height: context.height * 0.012),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //! titleButton
                  CustomButtonWidget(
                    title: widget.titleButton,
                    onTap: () {},
                    vertical: widget.vertical,
                    radius: widget.radius,
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.012),
            ],
          ),
        ),
      ),
    );
  }
}
