import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:invesier/core/components/custom_button_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({
    super.key,
    required this.title,
    required this.imageOnPressed,
    required this.videoOnPressed,
    required this.hintText,
    required this.titleButton,
  });
  final String title;
  final String hintText;
  final String titleButton;
  final Function() imageOnPressed;
  final Function() videoOnPressed;
  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  final commentController = TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
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
      child: Column(
        children: [
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
          SizedBox(height: context.height * 0.012),
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
          SizedBox(height: context.height * 0.023),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //!
                  IconButton(
                    onPressed: widget.imageOnPressed,
                    icon: Icon(
                      FontAwesomeIcons.image,
                      color: ColorManger.kOceanGreen,
                    ),
                  ),
                  //!
                  IconButton(
                    onPressed: widget.videoOnPressed,
                    icon: Icon(
                      FontAwesomeIcons.video,
                      color: ColorManger.kOceanGreen,
                    ),
                  ),
                ],
              ),
              CustomButtonWidget(title: widget.titleButton, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
