import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_button_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class NotificationStartedFollowingYouWidget extends StatelessWidget {
  const NotificationStartedFollowingYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: ColorManger.k1,
        borderRadius: BorderRadiusDirectional.circular(13),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        // image
        leading: ClipOval(
          child: Image.asset(
            ImageManger.kBoyThree,
            height: 45,
            width: 45,
            fit: BoxFit.cover,
          ),
        ),
        // title
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  'Charlie White',
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // title two
                Text(
                  '@charlie_w',
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorManger.kDarkenText,
                  ),
                ),
              ],
            ),
            // Chase Custom Button Widget
            CustomButtonWidget(
              title: 'Chase',
              titleColor: ColorManger.kWhite,
              backGroundColor: ColorManger.kTurquoiseBlue,
              borderColor: ColorManger.kTurquoiseBlue,
              radius: 31,
              vertical: 4,
              horizontal: 20,
            ),
          ],
        ),
        // subtitle
        subtitle: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'started following you.   ',
                style: context.kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: '2 hours ago',
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorManger.kDarkenText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
