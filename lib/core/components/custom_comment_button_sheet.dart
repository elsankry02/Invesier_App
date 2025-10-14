import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import 'custom_icon_button.dart';

class CustomCommentBottomSheet extends StatelessWidget {
  final String? hintText;
  final void Function()? commentOnTap;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? commentController;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;
  final bool isLoading;
  const CustomCommentBottomSheet({
    super.key,
    this.hintText,
    this.style,
    this.padding,
    this.borderRadius,
    this.commentController,
    this.isLoading = false,
    this.commentOnTap,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                CustomIconButton(
                  icon: SvgPicture.asset(AppSvgs.kReply),
                  onPressed: commentOnTap,
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
