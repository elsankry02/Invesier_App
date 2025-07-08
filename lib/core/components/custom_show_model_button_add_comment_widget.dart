import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/color_manger.dart';
import '../constant/svg_manger.dart';
import '../extension/extension.dart';
import 'custom_icon_button.dart';
import 'custom_primary_button.dart';

class CustomShowModelButtonAddCommentWidget extends StatefulWidget {
  const CustomShowModelButtonAddCommentWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.titleButton,
    required this.vertical,
    required this.radius,
    required this.style,
  });
  final String title, titleButton, hintText;
  final double vertical, radius;
  final TextStyle? style;

  @override
  State<CustomShowModelButtonAddCommentWidget> createState() =>
      _CustomShowModelButtonAddCommentWidgetState();
}

class _CustomShowModelButtonAddCommentWidgetState
    extends State<CustomShowModelButtonAddCommentWidget> {
  final commentController = TextEditingController();

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // kArrow
            SvgPicture.asset(SvgManger.kArrow),
            SizedBox(height: context.height * 0.004),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // titel
                Text(
                  widget.title,
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Custom Icon Back
                CustomIconButton(icon: Icon(FontAwesomeIcons.xmark)),
              ],
            ),
            // TextFormField
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
                // titleButton
                CustomPrimaryButton(
                  title: widget.titleButton,
                  backGroundColor: ColorManger.kOceanGreen,
                  borderColor: ColorManger.kOceanGreen,
                  paddingVertical: widget.vertical,
                  paddingHorizontal: 20,
                  marginHorizontal: 0,
                  radius: widget.radius,
                  onTap: () {},
                  style: widget.style,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.012),
          ],
        ),
      ),
    );
  }
}
