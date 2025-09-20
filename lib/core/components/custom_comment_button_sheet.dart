import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import 'custom_icon_button.dart';
import 'custom_primary_button.dart';

class CustomCommentBottomSheet extends StatelessWidget {
  final String title, titleButton;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? commentController;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  const CustomCommentBottomSheet({
    super.key,
    required this.title,
    required this.titleButton,
    this.hintText,
    this.style,
    this.padding,
    this.borderRadius,
    this.commentController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: context.height * 0.010,
        start: context.height * 0.020,
        end: context.height * 0.020,
      ),
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.kCodGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.height * 0.028),
          topRight: Radius.circular(context.height * 0.028),
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
            SvgPicture.asset(AppSvgs.kArrow),
            SizedBox(height: context.height * 0.004),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // titel
                Text(
                  title,
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
              cursorColor: AppColors.kWhite,
              controller: commentController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.kGray,
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
                  title: titleButton,
                  backGroundColor: AppColors.kOceanGreen,
                  border: Border.all(color: AppColors.kOceanGreen),
                  padding: padding,
                  borderRadius: borderRadius,
                  onTap: () {},
                  style: style,
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
