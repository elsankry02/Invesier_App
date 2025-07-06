import 'package:flutter/material.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/image_manger.dart';
import '../../../../../core/extension/extension.dart';

class NotificationUpvotedYourPostWidget extends StatelessWidget {
  const NotificationUpvotedYourPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: ColorManger.k1,
        borderRadius: BorderRadiusDirectional.circular(13),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        // image
        leading: Stack(
          clipBehavior: Clip.none,

          children: [
            // k1
            ClipOval(
              child: Image.asset(
                ImageManger.k1,
                height: 45,
                width: 45,
                fit: BoxFit.cover,
              ),
            ),
            // k2
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: ColorManger.k1),
                ),
                child: ClipOval(
                  child: Image.asset(
                    ImageManger.k2,
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        // title
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Maged, Kareem ',
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'and 208 others Upvoted your post.   ',
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '23 hours ago',
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorManger.kDarkenText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
