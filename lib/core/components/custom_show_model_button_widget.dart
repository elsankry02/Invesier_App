import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/color_manger.dart';
import '../constant/svg_manger.dart';
import '../extension/extension.dart';
import 'custom_icon_button.dart';
import 'custom_primary_button.dart';

class CustomShowModelButtonWidget extends StatefulWidget {
  final String title, titleButton, hintText;
  final double vertical, radius;
  final TextStyle? style;
  const CustomShowModelButtonWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.titleButton,
    required this.vertical,
    required this.radius,
    required this.style,
  });

  @override
  State<CustomShowModelButtonWidget> createState() =>
      _CustomShowModelButtonWidgetState();
}

class _CustomShowModelButtonWidgetState
    extends State<CustomShowModelButtonWidget> {
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
                CustomIconButton(
                  icon: Icon(FontAwesomeIcons.xmark),
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: widget.vertical,
                  ),
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
